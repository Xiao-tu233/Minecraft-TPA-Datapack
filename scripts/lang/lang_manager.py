import yaml
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).parent
print(ROOT)
LANG_FILE = ROOT / "langs.yaml"
OUTPUT_DIR = ROOT / "output"
OUTPUT_DIR.mkdir(exist_ok=True)


def load_langs() -> List[Dict]:
    with open(LANG_FILE, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)


def save_langs(data: List[Dict]):
    with open(LANG_FILE, "w", encoding="utf-8") as f:
        yaml.safe_dump(data, f, allow_unicode=True, sort_keys=False)


# -------------------------
# CRUD
# -------------------------

def add_lang(lang_id: int, name: str, display: str):
    data = load_langs()
    if any(l["id"] == lang_id for l in data):
        raise ValueError(f"Lang id {lang_id} already exists")

    data.append({
        "id": lang_id,
        "name": name,
        "name_display": display,
        "strings": {}
    })
    save_langs(data)


def remove_lang(lang_id: int):
    data = load_langs()
    data = [l for l in data if l["id"] != lang_id]
    save_langs(data)


def set_string(lang_id: int, key: str, value: str):
    data = load_langs()
    for lang in data:
        if lang["id"] == lang_id:
            lang.setdefault("strings", {})[key] = value
            save_langs(data)
            return
    raise ValueError(f"Lang id {lang_id} not found")


def delete_string(lang_id: int, key: str):
    data = load_langs()
    for lang in data:
        if lang["id"] == lang_id:
            lang.get("strings", {}).pop(key, None)
            save_langs(data)
            return


# -------------------------
# SNBT & MCFunction 生成
# -------------------------

def escape_snbt(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"')


def generate_snbt():
    langs = load_langs()
    entries = []

    for lang in langs:
        obj = [
            f'id:{lang["id"]}',
            f'name:"{lang["name"]}"',
            f'name_display:"{escape_snbt(lang["name_display"])}"'
        ]

        for k, v in lang.get("strings", {}).items():
            obj.append(f'{k}:"{escape_snbt(v)}"')

        entries.append("{%s}" % ",".join(obj))

    return "[{}," + ",".join(entries) + "]"


def generate_mcfunction():
    snbt = generate_snbt()
    return f'data modify storage tpa:tpa lang set value {snbt}\n'


def write_outputs():
    (OUTPUT_DIR / "lang.snbt").write_text(
        generate_snbt(), encoding="utf-8"
    )
    (OUTPUT_DIR / "load_lang.mcfunction").write_text(
        generate_mcfunction(), encoding="utf-8"
    )


if __name__ == "__main__":
    write_outputs()
