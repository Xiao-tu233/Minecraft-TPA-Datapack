from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from scripts.build_rules import apply_build_rules, convert_relative_path
from scripts.build_rules.before_1_20_2 import remove_function_line_continuations


class BuildRulesTests(unittest.TestCase):
    def test_resource_directory_names_follow_target_version(self) -> None:
        source = Path(
            "data/minecraft/tags/function/tpa.mcfunction"
        )
        self.assertEqual(
            convert_relative_path(source, (1, 20, 6, 0)),
            Path("data/minecraft/tags/functions/tpa.mcfunction"),
        )
        self.assertEqual(
            convert_relative_path(
                Path("data/tpa/predicate/available.json"),
                (1, 20, 6, 0),
            ),
            Path("data/tpa/predicates/available.json"),
        )
        self.assertEqual(
            convert_relative_path(
                Path("data/tpa/advancement/book.json"),
                (1, 20, 6, 0),
            ),
            Path("data/tpa/advancements/book.json"),
        )
        self.assertEqual(
            convert_relative_path(source, (1, 21, 0, 0)),
            source,
        )

    def test_removes_continuations_and_preserves_other_lines(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            data_root = Path(directory)
            function = data_root / "tpa" / "functions" / "example.mcfunction"
            function.parent.mkdir(parents=True)
            function.write_bytes(
                b"execute if entity @a \\\r\n"
                b"    run say first \\\r\n"
                b"        run say second\r\n"
                b"say untouched\r\n"
            )
            json_file = data_root / "tpa" / "predicate.json"
            json_file.write_text('"\\\\\\n"\n', encoding="utf-8")

            changed = remove_function_line_continuations(data_root)

            self.assertEqual(changed, 1)
            self.assertEqual(
                function.read_bytes(),
                b"execute if entity @a run say first run say second\r\n"
                b"say untouched\r\n",
            )
            self.assertEqual(json_file.read_text(encoding="utf-8"), '"\\\\\\n"\n')

    def test_rule_only_runs_for_versions_before_1_20_2(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            data_root = Path(directory)
            function = data_root / "example.mcfunction"
            function.write_text(
                "execute if entity @a \\\n    run say test\n",
                encoding="utf-8",
            )

            changed = apply_build_rules(data_root, (1, 20, 2, 0))
            self.assertEqual(changed, 0)
            self.assertIn("\\\n", function.read_text(encoding="utf-8"))

            changed = apply_build_rules(data_root, (1, 20, 1, 0))
            self.assertEqual(changed, 1)
            self.assertEqual(
                function.read_text(encoding="utf-8"),
                "execute if entity @a run say test\n",
            )


if __name__ == "__main__":
    unittest.main()
