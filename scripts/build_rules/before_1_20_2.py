"""Downgrades for datapack targets older than Minecraft 1.20.2."""

from __future__ import annotations

import re
from pathlib import Path


CONTINUATION = re.compile(r"[ \t]*\\[ \t]*(?:\r\n|\n|\r)[ \t]*")


def remove_function_line_continuations(data_root: Path) -> int:
    """Join backslash-continued mcfunction lines into single commands."""

    changed_files = 0
    for path in data_root.rglob("*.mcfunction"):
        with path.open("r", encoding="utf-8", newline="") as source:
            content = source.read()

        converted = CONTINUATION.sub(" ", content)
        if converted == content:
            continue

        with path.open("w", encoding="utf-8", newline="") as destination:
            destination.write(converted)
        changed_files += 1

    return changed_files
