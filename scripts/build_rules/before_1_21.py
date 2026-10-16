"""Downgrades resource directory names for Minecraft versions before 1.21."""

from __future__ import annotations

from pathlib import Path


LEGACY_DIRECTORY_NAMES = {
    "function": "functions",
    "predicate": "predicates",
    "advancement": "advancements",
}


def use_plural_resource_directories(relative: Path) -> Path:
    """Convert 1.21 singular resource directories to their pre-1.21 names."""

    return Path(*(LEGACY_DIRECTORY_NAMES.get(part, part) for part in relative.parts))
