import yaml
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).resolve().parents[2]  # 项目根目录
YML_PATH = "lang.yml"

TARGETS = [
    {
        "path": ROOT / "src/lang_extra/data/tpa_extra/functions/init_storage_lang.mcfunction",
        "pretty": False,
    },
    {
        "path": ROOT / "src/lang_extra/data/tpa_extra/function/init_storage_lang.mcfunction",
        "pretty": True,
    },
]


def snbt_compound(d: dict, pretty: bool) -> str:
    parts = []
    for k, v in d.items():
        if isinstance(v, str):
            v_escaped = v.replace("\\", "\\\\").replace('"', '\\"')
            parts.append(f'{k}: "{v_escaped}"')
        else:
            parts.append(f"{k}: {v}")
    left_bracket = "{" if not pretty else "{\\\n        "
    separator = ", " if not pretty else ", \\\n        "
    right_bracket = "}" if not pretty else " \\\n    }"
    return left_bracket + separator.join(parts) + right_bracket


def snbt_list(items: list, pretty=False) -> str:
    left_bracket = "[" if not pretty else "[\\\n    "
    separator = ", " if not pretty else ", \\\n    "
    right_bracket = "]" if not pretty else " \\\n]"
    return left_bracket + separator.join(snbt_compound(i, pretty) for i in items) + right_bracket


def generate_mcfunction(lang_items, pretty=False) -> str:
    snbt = snbt_list(lang_items, pretty)
    command_header_end = "\\\n" if pretty else ""
    return f"data modify storage tpa:tpa temp.lang set value {command_header_end}{snbt}\ndata modify storage tpa:tpa lang append from storage tpa:tpa temp.lang[]\n"


def main():
    with open(YML_PATH, encoding="utf-8") as f:
        lang_items = yaml.safe_load(f)

    for t in TARGETS:
        content = generate_mcfunction(lang_items, t["pretty"])
        t["path"].write_text(content, encoding="utf-8")
        print(f"[OK] synced -> {t['path']}")


if __name__ == "__main__":
    main()
