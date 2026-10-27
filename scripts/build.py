"""Build datapack artifacts without modifying the source tree."""

from __future__ import annotations

import argparse
import ast
import json
import re
import shutil
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

try:
    from build_rules import apply_build_rules, applicable_rules, convert_relative_path
except ModuleNotFoundError:
    from scripts.build_rules import (  # type: ignore[no-redef]
        apply_build_rules,
        applicable_rules,
        convert_relative_path,
    )


ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "src"
EXTRA = SRC / "extra"
BUILD = ROOT / "build"
RELEASE_META = ROOT / "scripts" / "release_meta.yml"
PACK_IMAGE = ROOT / "pack.png"
LANG_EXTRA = SRC / "lang_extra"
VERSION_INSERTING_LOCATOR = "#<--!Script Version Inserting Locator-->"
LanguageTargets = Tuple[Tuple[str, str], Tuple[str, str]]


@dataclass(frozen=True)
class McVersion:
    text: str
    parts: Tuple[int, int, int, int]

    @classmethod
    def parse(cls, value: str) -> "McVersion":
        match = re.fullmatch(r"(\d+(?:\.\d+){1,3})", value.strip())
        if not match:
            raise ValueError(f"Invalid Minecraft version: {value!r}")
        numbers = tuple(int(part) for part in match.group(1).split("."))
        padded = (numbers + (0, 0, 0, 0))[:4]
        return cls(match.group(1), padded)  # type: ignore[arg-type]

    def __lt__(self, other: "McVersion") -> bool:
        return self.parts < other.parts

    def __le__(self, other: "McVersion") -> bool:
        return self.parts <= other.parts

    def __gt__(self, other: "McVersion") -> bool:
        return self.parts > other.parts

    def __ge__(self, other: "McVersion") -> bool:
        return self.parts >= other.parts

    def __eq__(self, other: object) -> bool:
        return isinstance(other, McVersion) and self.parts == other.parts

    def __hash__(self) -> int:
        return hash(self.parts)


@dataclass(frozen=True)
class PackFormat:
    major: int
    minor: int = 0

    @property
    def json_value(self):
        return self.major if self.minor == 0 else float(f"{self.major}.{self.minor}")

    @property
    def range_value(self) -> int:
        return self.major


@dataclass(frozen=True)
class BuildProfile:
    suffix: str
    min_version: McVersion
    max_version: McVersion
    legacy_cutoff: Optional[McVersion] = None

    @property
    def artifact_name(self) -> str:
        return f"TPA_Datapack-{{release}}{self.suffix}"

    @property
    def is_modern_overlay_build(self) -> bool:
        return self.suffix == "+mc1.20.2"


def version(text: str) -> McVersion:
    return McVersion.parse(text)


# These boundaries match the format ranges currently used by this project.
PACK_FORMAT_BOUNDARIES: Tuple[Tuple[McVersion, PackFormat], ...] = tuple(
    (version(game_version), PackFormat(major, minor))
    for game_version, major, minor in (
        ("1.13", 4, 0),
        ("1.15", 5, 0),
        ("1.16", 6, 0),
        ("1.17", 7, 0),
        ("1.18", 8, 0),
        ("1.18.2", 9, 0),
        ("1.19", 10, 0),
        ("1.19.3", 12, 0),
        ("1.19.4", 13, 0),
        ("1.20", 15, 0),
        ("1.20.2", 18, 0),
        ("1.20.3", 26, 0),
        ("1.20.5", 41, 0),
        ("1.21", 49, 0),
        ("1.21.2", 61, 0),
        ("1.21.5", 71, 0),
        ("1.21.6", 87, 0),
        ("1.21.9", 91, 0),
        ("1.21.11", 97, 0),
        ("26.1", 101, 0),
        ("26.2", 107, 1),
        ("26.3", 121, 0),
    )
)


PROFILES: Tuple[BuildProfile, ...] = (
    BuildProfile(
        suffix="+mc1.13",
        min_version=version("1.13"),
        max_version=version("1.14.4"),
        legacy_cutoff=version("1.14.4"),
    ),
    BuildProfile(
        suffix="+mc1.15",
        min_version=version("1.15"),
        max_version=version("1.20.1"),
        legacy_cutoff=version("1.20.1"),
    ),
    BuildProfile(
        suffix="+mc1.20.2",
        min_version=version("1.20.2"),
        max_version=version("26.3"),
    ),
)

# Every format boundary below the modern base needs an overlay directory. The
# entries intentionally overlap: Minecraft uses the last matching entry, so a
# package can provide a complete snapshot at each supported format boundary.
REQUIRED_MODERN_OVERLAYS: Tuple[McVersion, ...] = tuple(
    boundary
    for boundary, _ in PACK_FORMAT_BOUNDARIES
    if version("1.20.2") <= boundary < version("26.3")
)


def load_release_meta() -> Dict[str, str]:
    """Read scalar release fields without making PyYAML mandatory."""

    try:
        import yaml  # type: ignore
    except ModuleNotFoundError:
        yaml = None

    if yaml is not None:
        with RELEASE_META.open(encoding="utf-8") as stream:
            loaded = yaml.safe_load(stream) or {}
        return {
            str(key): str(value)
            for key, value in loaded.items()
            if not isinstance(value, (dict, list))
        }

    result: Dict[str, str] = {}
    for raw_line in RELEASE_META.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or ":" not in line:
            continue
        key, raw_value = line.split(":", 1)
        value = raw_value.strip()
        if " #" in value:
            value = value.split(" #", 1)[0].rstrip()
        try:
            result[key.strip()] = str(ast.literal_eval(value))
        except (SyntaxError, ValueError):
            result[key.strip()] = value.strip("\"'")
    return result


def get_pack_format(game_version: McVersion) -> PackFormat:
    selected: Optional[PackFormat] = None
    for boundary, pack_format in PACK_FORMAT_BOUNDARIES:
        if boundary <= game_version:
            selected = pack_format
        else:
            break
    if selected is None:
        raise ValueError(f"No pack format mapping exists for Minecraft {game_version.text}")
    return selected


def format_directory_name(game_version: McVersion) -> str:
    return "format_" + game_version.text.replace(".", "_")


def discover_overlays(
    *, include_required: bool = True
) -> List[Tuple[McVersion, Path]]:
    if not EXTRA.is_dir():
        raise FileNotFoundError(f"Missing source directory: {EXTRA}")

    overlays: Dict[McVersion, Path] = {}
    for child in EXTRA.iterdir():
        if not child.is_dir() or child.name == "data":
            continue
        try:
            child_version = version(child.name)
        except ValueError:
            print(f"Skipping non-version source directory: {child.relative_to(ROOT)}")
            continue
        overlays[child_version] = child

    if include_required:
        for overlay_version in REQUIRED_MODERN_OVERLAYS:
            overlays.setdefault(
                overlay_version,
                EXTRA / overlay_version.text,
            )

    return sorted(overlays.items(), key=lambda item: item[0], reverse=True)


def copy_data_tree(
    source_data: Path,
    destination_root: Path,
    target_version: Tuple[int, int, int, int],
) -> None:
    if not source_data.is_dir():
        raise FileNotFoundError(f"Missing data directory: {source_data}")

    for source_file in source_data.rglob("*"):
        if not source_file.is_file():
            continue
        relative = source_file.relative_to(source_data)
        destination = destination_root / "data" / convert_relative_path(
            relative,
            target_version,
        )
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_file, destination)


def copy_converted_data_tree(
    source_data: Path,
    destination_root: Path,
    target_version: Tuple[int, int, int, int],
) -> None:
    """Copy an optional source tree after applying target-version rules."""

    if not source_data.is_dir():
        return

    with tempfile.TemporaryDirectory(prefix="tpa-build-converted-") as directory:
        converted_root = Path(directory)
        (converted_root / "data").mkdir(parents=True)
        copy_data_tree(source_data, converted_root, target_version)
        apply_build_rules(converted_root / "data", target_version)

        for source_file in (converted_root / "data").rglob("*"):
            if not source_file.is_file():
                continue
            relative = source_file.relative_to(converted_root / "data")
            destination = destination_root / "data" / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source_file, destination)


def copy_changed_data_tree(
    converted_data: Path,
    baseline_data: Path,
    destination_root: Path,
) -> None:
    """Copy only resources introduced by this overlay over the newer layer."""

    for source_file in converted_data.rglob("*"):
        if not source_file.is_file():
            continue
        relative = source_file.relative_to(converted_data)
        baseline_file = baseline_data / relative
        if (
            baseline_file.is_file()
            and source_file.read_bytes() == baseline_file.read_bytes()
        ):
            continue

        destination = destination_root / "data" / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_file, destination)


def copy_pack_image(destination: Path) -> None:
    if not PACK_IMAGE.is_file():
        raise FileNotFoundError(f"Missing project pack.png: {PACK_IMAGE}")
    shutil.copy2(PACK_IMAGE, destination / "pack.png")


def write_text_if_changed(path: Path, content: str) -> bool:
    """Write generated text only when its content changed."""

    if path.exists() and path.read_text(encoding="utf-8") == content:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8", newline="\n")
    return True


def synchronize_languages(*, check: bool) -> LanguageTargets:
    """Load synchronized language content without writing unless requested."""

    # build.py is normally executed as ``python scripts/build.py``, where the
    # scripts directory is already importable. The fallback also supports
    # ``python -m scripts.build`` from the repository root.
    try:
        from lang.sync_lang import generate_language_targets, synchronize_sources
    except ModuleNotFoundError:
        from scripts.lang.sync_lang import (  # type: ignore[no-redef]
            generate_language_targets,
            synchronize_sources,
        )

    all_languages = synchronize_sources(check=check)
    return (
        generate_language_targets(all_languages, pretty=True),
        generate_language_targets(all_languages, pretty=False),
    )


def write_generated_language_files(
    destination: Path,
    language_targets: LanguageTargets,
    legacy: bool,
    include_core: bool = True,
    include_extra: bool = False,
) -> None:
    """Write generated core and extension language functions into a build."""

    modern_targets, legacy_targets = language_targets
    core_content, extra_content = legacy_targets if legacy else modern_targets
    folder = "functions" if legacy else "function"

    core_path = destination / "data" / "tpa" / folder / "init_storage_lang.mcfunction"
    extra_path = (
        destination / "data" / "tpa_extra" / folder / "init_storage_lang.mcfunction"
    )
    if include_core:
        write_text_if_changed(core_path, core_content)
    if include_extra:
        write_text_if_changed(extra_path, extra_content)


def prepare_named_artifact(name: str) -> Path:
    artifact = BUILD / name
    if artifact.exists():
        shutil.rmtree(artifact)
    artifact.mkdir(parents=True)
    return artifact


def format_description(
    meta: Dict[str, str],
    profile: BuildProfile,
    minimum_version: Optional[McVersion] = None,
) -> str:
    template = meta.get("desc", "TPA Datapack {version} for MC{min_format}-{max_format}")
    minimum_version = minimum_version or profile.min_version
    replacements = {
        "version": meta.get("version", "unknown"),
        "min_format": minimum_version.text,
        "max_format": profile.max_version.text,
    }
    for key, value in replacements.items():
        template = template.replace("{" + key + "}", value)
    return template


def make_pack_meta(
    meta: Dict[str, str],
    profile: BuildProfile,
    overlay_versions: Sequence[McVersion],
    modern: bool,
) -> Dict[str, object]:
    maximum = get_pack_format(profile.max_version)
    if modern:
        # Overlay metadata itself is supported from format 16 onward.  This
        # range is independent of how many source overlays have been migrated.
        supported_minimum = PackFormat(16, 0)
        supported_maximum = PackFormat(999, 0)
        description_minimum = profile.min_version
    else:
        supported_minimum = get_pack_format(profile.min_version)
        supported_maximum = maximum
        description_minimum = profile.min_version

    pack: Dict[str, object] = {
        # ``pack_format`` is the legacy major-only field.  Minor formats such
        # as 107.1 are valid only in min_format/max_format.
        "pack_format": maximum.major if modern else supported_minimum.major,
        "description": format_description(
            meta,
            profile,
            description_minimum,
        ),
    }

    if not modern:
        return {"pack": pack}

    pack.update(
        {
            "supported_formats": [
                supported_minimum.range_value,
                supported_maximum.range_value,
            ],
            "min_format": [supported_minimum.major, supported_minimum.minor],
            "max_format": [supported_maximum.major, supported_maximum.minor],
        }
    )

    entries = []
    for overlay_version in sorted(overlay_versions, reverse=True):
        overlay_format = get_pack_format(overlay_version)
        entry: Dict[str, object] = {
            "formats": [supported_minimum.range_value, overlay_format.range_value],
            "directory": format_directory_name(overlay_version),
        }
        # This is the layout used by the existing modern source metadata:
        # min_format/max_format are scalar compatibility fields for the
        # 1.21+ entries, while the 1.20.x entries only need formats.
        if overlay_version >= version("1.21"):
            entry.update(
                {
                    "min_format": supported_minimum.range_value,
                    "max_format": overlay_format.range_value,
                }
            )
        entries.append(entry)
    pack_meta: Dict[str, object] = {"pack": pack}
    pack_meta["overlays"] = {"entries": entries}
    return pack_meta


def write_set_game_version(
    destination: Path,
    legacy: bool,
    value: str,
    detect_legacy_runtime: bool = False,
    target_version: Optional[Tuple[int, int, int, int]] = None,
) -> None:
    relative = Path(
        "tpa/functions/set_game_version.mcfunction"
        if legacy
        else "tpa/function/set_game_version.mcfunction"
    )
    if target_version is not None:
        relative = convert_relative_path(relative, target_version)
    target = destination / "data" / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    if detect_legacy_runtime:
        content = (
            "# Parent function: tpa:initialize\n"
            "scoreboard players set #is_1_16 tpa.variables 0\n"
            "scoreboard players set #is_1_17 tpa.variables 0\n"
            "execute store result score #is_1_16 tpa.variables run summon item ~ ~ ~ "
            "{Item: {id: \"target\", Count: 1}, PickupDelay: 32767s, Age: -32768s, "
            "Health: 0, NoGravity: true, Tags:[\"tpa.visual_item\"]}\n"
            "execute store result score #is_1_17 tpa.variables run summon item ~ ~ ~ "
            "{Item: {id: \"spyglass\", Count: 1}, PickupDelay: 32767s, Age: -32768s, "
            "Health: 0, NoGravity: true, Tags:[\"tpa.visual_item\"]}\n"
            "scoreboard players set #game_version tpa.config 115\n"
            "execute if score #is_1_16 tpa.variables matches 1 run "
            "scoreboard players add #game_version tpa.config 1\n"
            "execute if score #is_1_17 tpa.variables matches 1 run "
            "scoreboard players add #game_version tpa.config 1\n"
            "execute if score #game_version tpa.config matches 115 run "
            'data modify storage tpa:tpa option.game_version set value "1.15 - 1.15.2"\n'
            "execute if score #game_version tpa.config matches 116 run "
            'data modify storage tpa:tpa option.game_version set value "1.16 - 1.16.5"\n'
            "execute if score #game_version tpa.config matches 117 run "
            'data modify storage tpa:tpa option.game_version set value "1.17 - 1.20.1"\n'
            "kill @e[tag=tpa.visual_item]\n"
        )
    else:
        content = (
            "# Parent function: tpa:initialize\n"
            f'data modify storage tpa:tpa option.game_version set value "{value}"\n'
        )
    target.write_text(content, encoding="utf-8", newline="\n")


def write_pack_meta(destination: Path, pack_meta: Dict[str, object]) -> None:
    (destination / "pack.mcmeta").write_text(
        json.dumps(pack_meta, ensure_ascii=False, indent=4) + "\n",
        encoding="utf-8",
        newline="\n",
    )


def get_artifact_version_code(artifact: Path) -> str:
    """Read the version code that this artifact's initialize function stores."""

    candidates = (
        artifact / "data" / "tpa" / "function" / "initialize.mcfunction",
        artifact / "data" / "tpa" / "functions" / "initialize.mcfunction",
    )
    for path in candidates:
        if not path.is_file():
            continue
        content = path.read_text(encoding="utf-8")
        match = re.search(
            r"(?m)^scoreboard players set #version tpa\.config (\d+)\s*$",
            content,
        )
        if match:
            return match.group(1)
    raise ValueError(f"No #version initialization command found in {artifact}")


def apply_version_insertions(
    artifact: Path,
    profile: BuildProfile,
    release_version: str,
) -> int:
    """Resolve build-specific values at marked locations in mcfunction files."""

    changed_files = 0
    for path in artifact.rglob("*.mcfunction"):
        original = path.read_text(encoding="utf-8")
        lines = original.splitlines(keepends=True)
        locator_indexes = [
            index
            for index, line in enumerate(lines)
            if line.rstrip("\r\n") == VERSION_INSERTING_LOCATOR
        ]
        if not locator_indexes:
            continue

        for index in reversed(locator_indexes):
            if index + 1 >= len(lines):
                raise ValueError(f"Version locator has no following command: {path}")

            following = lines[index + 1]
            if path.name == "initialize.mcfunction":
                version_pattern = r'(option\.version set value ")[^"]*(")'
                if not re.search(version_pattern, following):
                    raise ValueError(f"Expected option.version after locator: {path}")
                version_line = re.sub(
                    version_pattern,
                    lambda match: f'{match.group(1)}v{release_version}{match.group(2)}',
                    following,
                )
                lines[index + 1] = version_line

                if index + 2 >= len(lines):
                    raise ValueError(f"Missing option.version_range after locator: {path}")
                range_pattern = r'(option\.version_range set value ")[^"]*(")'
                if not re.search(range_pattern, lines[index + 2]):
                    raise ValueError(f"Expected option.version_range after locator: {path}")
                range_line = re.sub(
                    range_pattern,
                    lambda match: (
                        f'{match.group(1)}{profile.min_version.text} - '
                        f'{profile.max_version.text}{match.group(2)}'
                    ),
                    lines[index + 2],
                )
                lines[index + 2] = range_line
            elif path.name == "uninstall.mcfunction":
                filename_pattern = r'TPA_Datapack-[^\\"]+'
                if not re.search(filename_pattern, following):
                    raise ValueError(f"Expected artifact filename after locator: {path}")
                updated = re.sub(
                    filename_pattern,
                    artifact.name,
                    following,
                )
                lines[index + 1] = updated
            elif path.name == "load.mcfunction":
                version_code = get_artifact_version_code(artifact)
                version_check_pattern = (
                    r"(execute unless score #version tpa\.config matches )\d+"
                )
                if not re.search(version_check_pattern, following):
                    raise ValueError(f"Expected #version check after locator: {path}")
                updated = re.sub(
                    version_check_pattern,
                    lambda match: f"{match.group(1)}{version_code}",
                    following,
                )
                lines[index + 1] = updated
            else:
                raise ValueError(f"Unsupported version locator location: {path}")

            del lines[index]

        updated_content = "".join(lines)
        if updated_content != original:
            path.write_text(updated_content, encoding="utf-8", newline="")
            changed_files += 1
    return changed_files


def make_language_extra_meta(meta: Dict[str, str]) -> Dict[str, object]:
    description = meta.get(
        "lang_extra_desc",
        "TPA Datapack language extra pack for TPA Datapack {version}",
    ).replace("{version}", meta.get("version", "unknown"))
    return {
        "pack": {
            "supported_formats": [5, 999],
            "pack_format": 5,
            "min_format": [5, 0],
            "max_format": [999, 0],
            "description": description,
        }
    }


def prepare_artifact(profile: BuildProfile, release_version: str) -> Path:
    return prepare_named_artifact(profile.artifact_name.format(release=release_version))


def build_modern(profile: BuildProfile, artifact: Path) -> List[Tuple[McVersion, Path]]:
    copy_data_tree(EXTRA / "data", artifact, profile.max_version.parts)
    overlays = [
        (overlay_version, overlay_root)
        for overlay_version, overlay_root in discover_overlays()
        if profile.min_version <= overlay_version < profile.max_version
    ]

    # Build every converted base tree once.  An overlay is incremental: its
    # files are compared with the already newer converted tree, not with the
    # modern base.  This matches the cumulative overlay order in pack.mcmeta.
    with tempfile.TemporaryDirectory(prefix="tpa-build-modern-variants-") as directory:
        variants_root = Path(directory)
        converted_by_rule_set: Dict[Tuple[str, ...], Path] = {}
        converted_variants: Dict[McVersion, Path] = {}
        for overlay_version, _ in overlays:
            rule_set = tuple(
                rule.name for rule in applicable_rules(overlay_version.parts)
            )
            converted_data = converted_by_rule_set.get(rule_set)
            if converted_data is None:
                variant_root = variants_root / str(len(converted_by_rule_set))
                variant_root.mkdir(parents=True)
                copy_data_tree(EXTRA / "data", variant_root, overlay_version.parts)
                apply_build_rules(variant_root / "data", overlay_version.parts)
                converted_data = variant_root / "data"
                converted_by_rule_set[rule_set] = converted_data
            converted_variants[overlay_version] = converted_data

        newer_data = artifact / "data"
        for overlay_version, overlay_root in overlays:
            target = artifact / format_directory_name(overlay_version)
            copy_changed_data_tree(
                converted_variants[overlay_version],
                newer_data,
                target,
            )
            copy_converted_data_tree(
                overlay_root / "data",
                target,
                overlay_version.parts,
            )
            write_set_game_version(
                target,
                legacy=False,
                value=overlay_version.text,
                target_version=overlay_version.parts,
            )
            newer_data = converted_variants[overlay_version]
    write_set_game_version(artifact, legacy=False, value=profile.max_version.text)
    copy_pack_image(artifact)
    return overlays


def build_legacy_from_extra(profile: BuildProfile, artifact: Path) -> None:
    cutoff = profile.legacy_cutoff
    if cutoff is None:
        raise ValueError(f"Legacy profile {profile.suffix} has no overlay cutoff")
    copy_data_tree(EXTRA / "data", artifact, profile.min_version.parts)
    overlays = [
        (overlay_version, overlay_root)
        for overlay_version, overlay_root in discover_overlays(include_required=False)
        if overlay_version >= cutoff
    ]
    for _, overlay_root in overlays:
        if (overlay_root / "data").is_dir():
            copy_data_tree(overlay_root / "data", artifact, profile.min_version.parts)
    write_set_game_version(
        artifact,
        legacy=True,
        value=f"{profile.min_version.text} - {profile.max_version.text}",
        detect_legacy_runtime=profile.suffix == "+mc1.15",
    )
    copy_pack_image(artifact)


def build_profile(
    profile: BuildProfile,
    meta: Dict[str, str],
    language_targets: LanguageTargets,
) -> Dict[str, object]:
    release_version = meta.get("version", "unknown")
    artifact = prepare_artifact(profile, release_version)

    if profile.is_modern_overlay_build:
        overlays = build_modern(profile, artifact)
        overlay_versions = [item[0] for item in overlays]
        modern = True
    else:
        build_legacy_from_extra(profile, artifact)
        overlay_versions = []
        modern = False

    inserted_files = apply_version_insertions(artifact, profile, release_version)
    if inserted_files:
        print(f"  Inserted build-specific version values in {inserted_files} file(s)")

    write_pack_meta(
        artifact,
        make_pack_meta(meta, profile, overlay_versions, modern),
    )
    write_generated_language_files(
        artifact,
        language_targets,
        legacy=not modern,
    )

    if modern:
        # The base source is the newest variant; overlays are converted on
        # their own version boundary.
        apply_build_rules(artifact / "data", profile.max_version.parts)
    else:
        # A single legacy artifact must work across its full version range.
        apply_build_rules(artifact / "data", profile.min_version.parts)

    return {
        "profile": profile.suffix,
        "path": str(artifact.relative_to(ROOT)).replace("\\", "/"),
        "min_version": profile.min_version.text,
        "max_version": profile.max_version.text,
        "name": artifact.name,
    }


def build_language_extra(
    meta: Dict[str, str],
    language_targets: LanguageTargets,
) -> Optional[Dict[str, object]]:
    """Build the optional package containing non-core languages."""

    if not LANG_EXTRA.is_dir():
        return None

    release_version = meta.get("version", "unknown")
    artifact = prepare_named_artifact(f"TPA_Datapack-{release_version}-lang_extra")
    generated_paths = {
        Path("data/tpa_extra/function/init_storage_lang.mcfunction"),
        Path("data/tpa_extra/functions/init_storage_lang.mcfunction"),
    }
    for source_file in LANG_EXTRA.rglob("*"):
        if not source_file.is_file():
            continue
        relative = source_file.relative_to(LANG_EXTRA)
        if relative in {Path("pack.mcmeta"), Path("pack.png")}:
            continue
        if relative in generated_paths:
            continue
        destination = artifact / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_file, destination)

    copy_pack_image(artifact)
    write_generated_language_files(
        artifact,
        language_targets,
        legacy=False,
        include_core=False,
        include_extra=True,
    )
    write_generated_language_files(
        artifact,
        language_targets,
        legacy=True,
        include_core=False,
        include_extra=True,
    )
    write_pack_meta(artifact, make_language_extra_meta(meta))
    return {
        "kind": "language_extra",
        "path": str(artifact.relative_to(ROOT)).replace("\\", "/"),
        "name": artifact.name,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build Minecraft-TPA-Datapack artifacts")
    parser.add_argument(
        "--profile",
        action="append",
        choices=[profile.suffix for profile in PROFILES],
        help="Build only this source profile; may be passed more than once",
    )
    parser.add_argument(
        "--sync-languages",
        action="store_true",
        help=(
            "write synchronized language YAML and todo_translate.yml before building; "
            "default builds only check them in memory"
        ),
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    meta = load_release_meta()
    language_targets = synchronize_languages(check=not args.sync_languages)
    BUILD.mkdir(parents=True, exist_ok=True)
    selected = [
        profile for profile in PROFILES if not args.profile or profile.suffix in args.profile
    ]

    artifacts = []
    for profile in selected:
        print(f"Building {profile.suffix}...")
        artifacts.append(build_profile(profile, meta, language_targets))

    language_extra = build_language_extra(meta, language_targets)

    manifest = {
        "release_version": meta.get("version", "unknown"),
        "artifacts": artifacts,
        "packages": [language_extra] if language_extra is not None else [],
    }
    (BUILD / "manifest.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
        newline="\n",
    )
    package_count = len(artifacts) + (1 if language_extra is not None else 0)
    print(f"Built {package_count} package(s) in {BUILD}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
