"""Build datapack artifacts without modifying the source tree."""

from __future__ import annotations

import argparse
import ast
import json
import re
import shutil
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

try:
    from build_rules import apply_build_rules, convert_relative_path
except ModuleNotFoundError:
    from scripts.build_rules import (  # type: ignore[no-redef]
        apply_build_rules,
        convert_relative_path,
    )


ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "src"
EXTRA = SRC / "extra"
BUILD = ROOT / "build"
RELEASE_META = ROOT / "scripts" / "release_meta.yml"
PACK_IMAGE = ROOT / "pack.png"
LANG_EXTRA = SRC / "lang_extra"
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
    source_fallback: Path
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
        ("26.2", 105, 0),
        ("26.3", 107, 1),
    )
)


PROFILES: Tuple[BuildProfile, ...] = (
    BuildProfile(
        suffix="+mc1.13",
        min_version=version("1.13"),
        max_version=version("1.14.4"),
        source_fallback=SRC / "+mc1.13",
        legacy_cutoff=version("1.14.4"),
    ),
    BuildProfile(
        suffix="+mc1.15",
        min_version=version("1.15"),
        max_version=version("1.20.1"),
        source_fallback=SRC / "+mc1.15",
        legacy_cutoff=version("1.20.1"),
    ),
    BuildProfile(
        suffix="+mc1.20.2",
        min_version=version("1.20.2"),
        max_version=version("26.3"),
        source_fallback=SRC / "+mc1.20.2",
    ),
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


def discover_extra_overlays() -> List[Tuple[McVersion, Path]]:
    if not EXTRA.is_dir():
        raise FileNotFoundError(f"Missing source directory: {EXTRA}")

    overlays: List[Tuple[McVersion, Path]] = []
    for child in EXTRA.iterdir():
        if not child.is_dir() or child.name == "data":
            continue
        try:
            child_version = version(child.name)
        except ValueError:
            print(f"Skipping non-version source directory: {child.relative_to(ROOT)}")
            continue
        if not (child / "data").is_dir():
            print(f"Skipping overlay without data/: {child.relative_to(ROOT)}")
            continue
        overlays.append((child_version, child))
    return sorted(overlays, key=lambda item: item[0], reverse=True)


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


def synchronize_languages() -> LanguageTargets:
    """Synchronize language YAML files and return generated language content."""

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

    all_languages = synchronize_sources()
    return (
        generate_language_targets(all_languages, pretty=True),
        generate_language_targets(all_languages, pretty=False),
    )


def write_generated_language_files(
    destination: Path,
    language_targets: LanguageTargets,
    legacy: bool,
    overlay_destinations: Sequence[Path] = (),
    include_core: bool = True,
    include_extra: bool = False,
) -> None:
    """Write generated core and extension language functions into a build."""

    modern_targets, legacy_targets = language_targets
    core_content, extra_content = legacy_targets if legacy else modern_targets
    folder = "functions" if legacy else "function"

    destinations = [destination, *overlay_destinations]
    for target in destinations:
        core_path = target / "data" / "tpa" / folder / "init_storage_lang.mcfunction"
        extra_path = (
            target / "data" / "tpa_extra" / folder / "init_storage_lang.mcfunction"
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
        "pack_format": maximum.json_value if modern else supported_minimum.json_value,
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
    for overlay_version in overlay_versions:
        overlay_format = get_pack_format(overlay_version)
        entries.append(
            {
                "formats": [
                    supported_minimum.range_value,
                    overlay_format.range_value,
                ],
                "min_format": supported_minimum.range_value,
                "max_format": overlay_format.range_value,
                "directory": format_directory_name(overlay_version),
            }
        )
    pack_meta: Dict[str, object] = {"pack": pack}
    pack_meta["overlays"] = {"entries": entries}
    return pack_meta


def write_set_game_version(
    destination: Path,
    legacy: bool,
    value: str,
    detect_legacy_runtime: bool = False,
) -> None:
    folder = "functions" if legacy else "function"
    target = destination / "data" / "tpa" / folder / "set_game_version.mcfunction"
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


def has_legacy_source(profile: BuildProfile) -> bool:
    return bool(
        profile.legacy_cutoff
        and (EXTRA / profile.legacy_cutoff.text / "data").is_dir()
        and (EXTRA / "data").is_dir()
    )


def build_modern(profile: BuildProfile, artifact: Path) -> List[Tuple[McVersion, Path]]:
    copy_data_tree(EXTRA / "data", artifact, profile.max_version.parts)
    overlays = [
        (overlay_version, overlay_root)
        for overlay_version, overlay_root in discover_extra_overlays()
        if overlay_version >= profile.min_version
    ]
    for overlay_version, overlay_root in overlays:
        target = artifact / format_directory_name(overlay_version)
        copy_data_tree(overlay_root / "data", target, overlay_version.parts)
        write_set_game_version(target, legacy=False, value=overlay_version.text)
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
        for overlay_version, overlay_root in discover_extra_overlays()
        if overlay_version >= cutoff
    ]
    for _, overlay_root in overlays:
        copy_data_tree(overlay_root / "data", artifact, profile.min_version.parts)
    write_set_game_version(
        artifact,
        legacy=True,
        value=f"{profile.min_version.text} - {profile.max_version.text}",
        detect_legacy_runtime=profile.suffix == "+mc1.15",
    )
    copy_pack_image(artifact)


def build_legacy_fallback(profile: BuildProfile, artifact: Path) -> None:
    if not profile.source_fallback.is_dir():
        raise FileNotFoundError(
            f"Neither new legacy layers nor fallback source exists for {profile.suffix}: "
            f"{profile.source_fallback}"
        )
    for source_file in profile.source_fallback.rglob("*"):
        if not source_file.is_file() or source_file.name in {"pack.mcmeta", "pack.png"}:
            continue
        relative = source_file.relative_to(profile.source_fallback)
        destination = artifact / convert_relative_path(
            relative,
            profile.min_version.parts,
        )
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source_file, destination)
    write_set_game_version(
        artifact,
        legacy=True,
        value=f"{profile.min_version.text} - {profile.max_version.text}",
        detect_legacy_runtime=profile.suffix == "+mc1.15",
    )
    copy_pack_image(artifact)
    print(
        f"  {profile.suffix}: using legacy fallback "
        f"{profile.source_fallback.relative_to(ROOT)} until its src/extra layers are available"
    )


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
    elif has_legacy_source(profile):
        build_legacy_from_extra(profile, artifact)
        overlay_versions = []
        modern = False
    else:
        build_legacy_fallback(profile, artifact)
        overlay_versions = []
        modern = False

    write_pack_meta(
        artifact,
        make_pack_meta(meta, profile, overlay_versions, modern),
    )
    overlay_destinations = [
        artifact / format_directory_name(overlay_version)
        for overlay_version in overlay_versions
    ]
    write_generated_language_files(
        artifact,
        language_targets,
        legacy=not modern,
        overlay_destinations=overlay_destinations,
    )

    if modern:
        # The base source is the newest variant; overlays are converted on
        # their own version boundary.
        apply_build_rules(artifact / "data", profile.max_version.parts)
        for overlay_version in overlay_versions:
            overlay_data = (
                artifact
                / format_directory_name(overlay_version)
                / "data"
            )
            apply_build_rules(overlay_data, overlay_version.parts)
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
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    meta = load_release_meta()
    language_targets = synchronize_languages()
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
