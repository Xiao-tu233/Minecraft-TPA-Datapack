"""Exercise the actual users functions in a small command-subset interpreter.

This checks storage/state transitions, not Minecraft's command parser or NBT types.
Run with: python -B scripts/tests/test_users_storage.py
"""

import copy
import json
from pathlib import Path
import re
import unittest


FUNCTIONS = Path(__file__).resolve().parents[2] / 'src/extra/data/tpa/function'


def literal(value):
    value = re.sub(r'([A-Za-z_][A-Za-z_0-9]*):', r'"\1":', value)
    value = re.sub(r'(-?\d+)b\b', r'\1', value)
    return json.loads(value)


class Returned(Exception):
    def __init__(self, outcome):
        self.outcome = outcome


class Runtime:
    def __init__(self, users=None):
        self.storage = {'users': copy.deepcopy(users or []), 'temp': {'users': {}}}
        self.scores = {('@s', 'tpa.uid'): 1}
        self.commands = 0

    def parts(self, path):
        return [int(index) if index else key for key, index in
                re.findall(r'([\w]+)|\[(-?\d+)\]', path)]

    def read(self, path):
        value = self.storage
        for part in self.parts(path):
            value = value[part]
        return value

    def exists(self, path):
        match = re.fullmatch(r'(.+?)(\{.*\})?', path)
        try:
            value = self.read(match[1])
            return not match[2] or all(value.get(k) == v for k, v in literal(match[2]).items())
        except (KeyError, IndexError, TypeError, AttributeError):
            return False

    def write(self, path, value):
        parts = self.parts(path)
        parent = self.storage
        for part in parts[:-1]:
            if isinstance(parent, dict) and part not in parent:
                parent[part] = {}
            parent = parent[part]
        old = parent.get(parts[-1]) if isinstance(parent, dict) else parent[parts[-1]]
        parent[parts[-1]] = copy.deepcopy(value)
        return old != value

    def call(self, name):
        path = FUNCTIONS / (name.removeprefix('tpa:') + '.mcfunction')
        try:
            for line in path.read_text(encoding='utf-8').splitlines():
                if line.strip() and not line.startswith('#'):
                    self.run(line)
        except Returned as result:
            return result.outcome
        return True, 1

    def run(self, command):
        self.commands += 1
        if self.commands > 100000:
            raise AssertionError('Function did not terminate')
        try:
            return self.execute(command)
        except (KeyError, IndexError, TypeError, ValueError):
            return False, 0

    def execute(self, command):
        if command.startswith('return '):
            tail = command[7:]
            raise Returned(self.run(tail[4:]) if tail.startswith('run ') else (True, int(tail)))
        if command.startswith('function '):
            return self.call(command[9:])
        if command.startswith('execute '):
            clauses, child = command[8:].split(' run ', 1)
            stores = []
            while clauses:
                condition = re.match(r'(if|unless) score (\S+) (\S+) (?:matches (\S+)|([=<>]+) (\S+) (\S+))', clauses)
                data = re.match(r'(if|unless) data storage tpa:tpa (\S+?\{[^}]*\}|\S+)', clauses)
                score_store = re.match(r'store (result|success) score (\S+) (\S+)', clauses)
                nbt_store = re.match(r'store (result|success) storage tpa:tpa (\S+) int 1', clauses)
                if condition:
                    kind, name, objective, span, op, other, other_objective = condition.groups()
                    value = self.scores.get((name, objective))
                    if span:
                        bounds = span.split('..')
                        low = int(bounds[0]) if bounds[0] else -float('inf')
                        high = int(bounds[-1]) if bounds[-1] else float('inf')
                        passes = value is not None and low <= value <= high
                    else:
                        rhs = self.scores.get((other, other_objective))
                        passes = value is not None and rhs is not None and {
                            '=': lambda: value == rhs, '>': lambda: value > rhs,
                            '<': lambda: value < rhs, '>=': lambda: value >= rhs,
                            '<=': lambda: value <= rhs,
                        }[op]()
                    match = condition
                elif data:
                    kind, path = data.groups()
                    passes = self.exists(path)
                    match = data
                elif score_store:
                    stores.append(('score', *score_store.groups()))
                    match = score_store
                elif nbt_store:
                    stores.append(('nbt', *nbt_store.groups()))
                    match = nbt_store
                else:
                    raise AssertionError(f'Unsupported execute clause: {clauses}')
                if condition or data:
                    if passes != (kind == 'if'):
                        return False, 0
                clauses = clauses[match.end():].lstrip()
            success, result = self.run(child)
            for store in stores:
                value = int(success) if store[1] == 'success' else result
                if store[0] == 'score':
                    self.scores[(store[2], store[3])] = value
                else:
                    self.write(store[2], value)
            return success, result
        if command.startswith('scoreboard players '):
            tokens = command.split()
            op, name, objective = tokens[2:5]
            key = name, objective
            if op == 'set':
                self.scores[key] = int(tokens[5])
            elif op == 'get':
                return True, self.scores[key]
            elif op in ('add', 'remove'):
                self.scores[key] = self.scores.get(key, 0) + int(tokens[5]) * (1 if op == 'add' else -1)
            elif op == 'operation':
                operator = tokens[5]
                rhs = self.scores[(tokens[6], tokens[7])]
                lhs = self.scores.get(key, 0)
                self.scores[key] = {'=': lambda: rhs, '+=': lambda: lhs + rhs,
                                    '-=': lambda: lhs - rhs, '*=': lambda: lhs * rhs,
                                    '/=': lambda: int(lhs / rhs)}[operator]()
            else:
                raise AssertionError(command)
            return True, self.scores[key]
        match = re.fullmatch(r'data (get|remove) storage tpa:tpa (\S+)', command)
        if match:
            op, path = match.groups()
            value = self.read(path)
            if op == 'get':
                return True, len(value) if isinstance(value, (list, str, dict)) else int(value)
            parent = self.storage
            parts = self.parts(path)
            for part in parts[:-1]:
                parent = parent[part]
            del parent[parts[-1]]
            return True, 1
        match = re.fullmatch(r'data modify storage tpa:tpa (\S+) (set|append) (value|from storage tpa:tpa) (.+)', command)
        if match:
            path, op, source, value = match.groups()
            value = literal(value) if source == 'value' else copy.deepcopy(self.read(value))
            if op == 'set':
                changed = self.write(path, value)
                return changed, int(changed)
            self.read(path).append(copy.deepcopy(value))
            return True, 1
        raise AssertionError(f'Unsupported command: {command}')


def user(uid, name=None, uuid=None):
    return {'uid': uid, 'uuid': uuid or [uid, -uid, 42, 7],
            'name': name or f'User{uid}', 'previous_names': []}


class UsersStorageTests(unittest.TestCase):
    def test_function_references_and_copy_leftovers(self):
        for path in (FUNCTIONS / 'users').rglob('*.mcfunction'):
            for line in path.read_text(encoding='utf-8').splitlines():
                if not line or line.startswith('#'):
                    continue
                self.assertNotIn('warp', line, str(path))
                self.assertFalse(line.startswith('$'), str(path))
                self.assertIsNone(re.search(r'\breturn\b', line), str(path))
                self.assertIsNone(re.search(r'\[[^\]]+\]\{', line), str(path))
                for name in re.findall(r'\bfunction tpa:([\w/]+)', line):
                    self.assertTrue((FUNCTIONS / (name + '.mcfunction')).is_file(), name)

    def query(self, runtime, function_name, **arguments):
        runtime.storage['temp']['users']['input'] = arguments
        runtime.call('tpa:users/' + function_name)
        return runtime.scores[('#users.result', 'tpa.variables')]

    def test_uid_and_uuid_ignore_physical_position(self):
        runtime = Runtime([user(80), user(2), user(31)])
        original = copy.deepcopy(runtime.storage['users'])
        self.assertEqual(self.query(runtime, 'get', uid=2), 1)
        self.assertEqual(runtime.read('temp.users.result.uid'), 2)
        self.assertEqual(self.query(runtime, 'find_uuid', uuid=user(31)['uuid']), 1)
        self.assertEqual(runtime.read('temp.users.result.uid'), 31)
        self.assertEqual(runtime.storage['users'], original)
        self.assertEqual(self.query(runtime, 'get', uid=999), 0)
        self.assertFalse(runtime.exists('temp.users.result'))

    def test_name_candidates_and_duplicate_uuid(self):
        first, second = user(1, 'New'), user(2, 'Old')
        first['previous_names'] = ['Old', 'Old']
        runtime = Runtime([first, second])
        self.assertEqual(self.query(runtime, 'find_name', name='Old'), 1)
        self.assertEqual(self.query(runtime, 'find_name', name='Old', include_previous_names=1), 2)
        self.assertEqual(len(runtime.read('temp.users.results')), 2)
        self.assertFalse(runtime.exists('temp.users.result'))
        runtime.storage['users'][1]['uuid'] = first['uuid']
        self.assertEqual(self.query(runtime, 'find_uuid', uuid=first['uuid']), 2)

    def test_add_rejects_uid_or_uuid_collision(self):
        runtime = Runtime([user(9)])
        for candidate in [user(9, 'Other'), user(10, uuid=user(9)['uuid'])]:
            runtime.storage['temp']['users']['candidate'] = candidate
            runtime.call('tpa:users/add')
            self.assertEqual(runtime.scores[('#users.result', 'tpa.variables')], 2)
            self.assertEqual(runtime.storage['users'], [user(9)])
            self.assertFalse(runtime.exists('temp.users.result'))
        runtime.storage['temp']['users']['candidate'] = user(22)
        runtime.call('tpa:users/add')
        self.assertEqual([entry['uid'] for entry in runtime.storage['users']], [9, 22])

    def test_update_preserves_history_and_prevents_uuid_reassignment(self):
        runtime = Runtime([user(1, 'Old')])
        for name in ['New', 'Old', 'New']:
            runtime.storage['temp']['users']['candidate'] = user(1, name)
            runtime.call('tpa:users/set')
            self.assertEqual(runtime.scores[('#users.result', 'tpa.variables')], 1)
        self.assertEqual(runtime.storage['users'][0]['previous_names'], ['Old', 'New'])
        original = copy.deepcopy(runtime.storage['users'])
        runtime.storage['temp']['users']['candidate'] = user(1, uuid=[9, 9, 9, 9])
        runtime.call('tpa:users/set')
        self.assertEqual(runtime.scores[('#users.result', 'tpa.variables')], 2)
        self.assertEqual(runtime.storage['users'], original)
        del runtime.storage['users'][0]['uuid']
        runtime.call('tpa:users/set')
        self.assertEqual(runtime.storage['users'][0]['uuid'], [9, 9, 9, 9])

    def test_empty_invalid_and_unmigrated_storage(self):
        for users in [[], [''], ['', 'LegacyPlayer']]:
            runtime = Runtime(users)
            original = copy.deepcopy(runtime.storage['users'])
            self.assertEqual(self.query(runtime, 'get', uid=1), 0 if not users else 3)
            self.assertEqual(runtime.storage['users'], original)
        runtime = Runtime([user(1)])
        self.assertEqual(self.query(runtime, 'get', uid=0), 3)
        self.assertEqual(self.query(runtime, 'find_uuid', uuid=[1, 2, 3]), 3)

    def test_pages_viewers_slot_resolution_and_shrinking_list(self):
        runtime = Runtime([user(uid) for uid in [40, 2, 19, 8, 11, 70]])
        original = copy.deepcopy(runtime.storage['users'])
        runtime.call('tpa:users/page/next')
        self.assertEqual(runtime.scores[('#users.page.result', 'tpa.variables')], 2)
        runtime.scores[('#users', 'tpa.variables')] = -3
        runtime.call('tpa:users/resolve_slot')
        self.assertEqual(runtime.scores[('#users.selected_uid', 'tpa.variables')], 70)
        runtime.scores[('#users', 'tpa.variables')] = -4
        runtime.call('tpa:users/resolve_slot')
        self.assertEqual(runtime.scores[('#users.result', 'tpa.variables')], 0)
        self.assertEqual(runtime.scores[('#users.selected_uid', 'tpa.variables')], 0)
        runtime.scores[('@s', 'tpa.uid')] = 2
        runtime.call('tpa:users/page/previous')
        self.assertEqual(runtime.scores[('#users.page.result', 'tpa.variables')], 1)
        runtime.scores[('@s', 'tpa.uid')] = 1
        runtime.call('tpa:users/page/get')
        self.assertEqual(runtime.scores[('#users.page.result', 'tpa.variables')], 2)
        self.assertEqual(runtime.storage['users'], original)
        runtime.storage['users'] = runtime.storage['users'][:2]
        runtime.call('tpa:users/page/get')
        self.assertEqual(runtime.scores[('#users.page.result', 'tpa.variables')], 1)
        self.assertEqual(runtime.storage['users_pages'], [{'uid': 1, 'page': 1}, {'uid': 2, 'page': 1}])
        self.assertTrue(all('sentinel' not in item for item in runtime.storage['users_pages']))


if __name__ == '__main__':
    unittest.main()
