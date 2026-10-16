"""Build and deploy the appropriate generated datapack to local test servers."""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Tuple


ROOT = Path(__file__).resolve().parent.parent
SERVER_DIR = ROOT / "servers"
BUILD_DIR = ROOT / "build"
BUILD_SCRIPT = Path(__file__).with_name("build.py")
GENERATED_PREFIX = "TPA_Datapack-"


def version_key(value: str) -> Tuple[int, int, int, int]:
    match = re.fullmatch(r"(\d+(?:\.\d+){1,3})", value.strip())
    if not match:
        raise ValueError(f"Invalid Minecraft version: {value!r}")
    numbers = tuple(int(part) for part in match.group(1).split("."))
    return (numbers + (0, 0, 0, 0))[:4]  # type: ignore[return-value]


def in_range(
    server_version: Tuple[int, int, int, int],
    minimum: str,
    maximum: str,
) -> bool:
    return version_key(minimum) <= server_version <= version_key(maximum)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Deploy Minecraft-TPA-Datapack to local test servers"
    )
    parser.add_argument(
        "--server",
        action="append",
        help="Deploy only this servers/<version> directory; may be passed more than once",
    )
    parser.add_argument(
        "--no-build",
        action="store_true",
        help="Use existing build/manifest.json instead of running build.py",
    )
    return parser.parse_args()


def run_build() -> None:
    print("Running build.py before deployment...")
    subprocess.run([sys.executable, str(BUILD_SCRIPT)], cwd=ROOT, check=True)


def load_manifest() -> List[Dict[str, str]]:
    manifest_path = BUILD_DIR / "manifest.json"
    if not manifest_path.is_file():
        raise FileNotFoundError(f"Build manifest does not exist: {manifest_path}")
    with manifest_path.open(encoding="utf-8") as stream:
        manifest = json.load(stream)
    artifacts = manifest.get("artifacts")
    if not isinstance(artifacts, list):
        raise ValueError(f"Invalid build manifest: {manifest_path}")
    return artifacts


def choose_artifact(
    server_version: Tuple[int, int, int, int],
    artifacts: List[Dict[str, str]],
) -> Dict[str, str]:
    matches = [
        artifact
        for artifact in artifacts
        if in_range(server_version, artifact["min_version"], artifact["max_version"])
    ]
    if not matches:
        raise ValueError(f"No built datapack supports server version {server_version}")
    return max(matches, key=lambda artifact: version_key(artifact["min_version"]))


def remove_previous_generated_packs(datapacks: Path) -> None:
    if not datapacks.exists():
        return
    for child in datapacks.iterdir():
        if not child.name.startswith(GENERATED_PREFIX):
            continue
        if child.is_dir():
            shutil.rmtree(child)
        else:
            child.unlink()


def deploy_server(server_dir: Path, artifact: Dict[str, str]) -> None:
    datapacks = server_dir / "world" / "datapacks"
    source = ROOT / artifact["path"]
    if not source.is_dir():
        raise FileNotFoundError(f"Built artifact does not exist: {source}")
    datapacks.mkdir(parents=True, exist_ok=True)
    remove_previous_generated_packs(datapacks)
    destination = datapacks / artifact["name"]
    shutil.copytree(source, destination)
    print(f"  {server_dir.name}: {artifact['name']}")


def main() -> int:
    args = parse_args()
    if not args.no_build:
        run_build()
    artifacts = load_manifest()

    requested = set(args.server or [])
    server_dirs = []
    for candidate in sorted(SERVER_DIR.iterdir()):
        if not candidate.is_dir():
            continue
        if requested and candidate.name not in requested:
            continue
        try:
            version_key(candidate.name)
        except ValueError:
            print(f"Skipping non-version server directory: {candidate.relative_to(ROOT)}")
            continue
        server_dirs.append(candidate)

    if requested:
        missing = requested - {server.name for server in server_dirs}
        if missing:
            raise FileNotFoundError(
                "Requested server directory does not exist or is not a version: "
                + ", ".join(sorted(missing))
            )

    deployment_plan = []
    for server_dir in server_dirs:
        server_version = version_key(server_dir.name)
        artifact = choose_artifact(server_version, artifacts)
        source = ROOT / artifact["path"]
        if not source.is_dir():
            raise FileNotFoundError(f"Built artifact does not exist: {source}")
        deployment_plan.append((server_dir, artifact))

    for server_dir, artifact in deployment_plan:
        deploy_server(server_dir, artifact)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
