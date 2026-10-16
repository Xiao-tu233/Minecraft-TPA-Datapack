"""Version-specific, automatic source-to-build conversions.

Each rule reverses a format change introduced in a Minecraft version. A rule
applies to targets older than that version. When several downgrades apply, they
run newest-first so each step receives the format produced by the newer step.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Optional, Tuple

from .before_1_20_2 import remove_function_line_continuations
from .before_1_21 import use_plural_resource_directories


Version = Tuple[int, int, int, int]
RuleAction = Callable[[Path], int]
PathAction = Callable[[Path], Path]


@dataclass(frozen=True)
class BuildRule:
    introduced_in: Version
    name: str
    apply: Optional[RuleAction] = None
    convert_path: Optional[PathAction] = None


RULES = (
    BuildRule(
        introduced_in=(1, 20, 2, 0),
        name="remove mcfunction line continuations",
        apply=remove_function_line_continuations,
    ),
    BuildRule(
        introduced_in=(1, 21, 0, 0),
        name="use plural resource directories",
        convert_path=use_plural_resource_directories,
    ),
)


def applicable_rules(target_version: Version) -> list[BuildRule]:
    return sorted(
        (rule for rule in RULES if target_version < rule.introduced_in),
        key=lambda rule: rule.introduced_in,
        reverse=True,
    )


def convert_relative_path(relative: Path, target_version: Version) -> Path:
    """Apply version-specific path conversions to a source-relative path."""

    converted = relative
    for rule in applicable_rules(target_version):
        if rule.convert_path is not None:
            converted = rule.convert_path(converted)
    return converted


def apply_build_rules(data_root: Path, target_version: Version) -> int:
    """Apply every downgrade rule needed by a datapack data tree.

    ``target_version`` describes the game version represented by this output
    tree. For a ranged legacy package, pass its minimum version because every
    file must remain readable there. A modern package's base tree represents
    its maximum version; each overlay tree is processed using its own version.
    """

    if not data_root.is_dir():
        raise FileNotFoundError(f"Missing datapack data directory: {data_root}")

    changed_files = 0
    for rule in applicable_rules(target_version):
        if rule.apply is None:
            continue
        changed = rule.apply(data_root)
        changed_files += changed
        if changed:
            print(f"  Build rule '{rule.name}': updated {changed} file(s)")

    return changed_files


__all__ = [
    "BuildRule",
    "RULES",
    "apply_build_rules",
    "convert_relative_path",
]
