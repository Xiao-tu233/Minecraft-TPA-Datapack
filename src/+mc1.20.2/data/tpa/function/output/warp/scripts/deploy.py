from pathlib import Path
from packaging.version import Version
from shutil import copytree, rmtree

try:
    import yaml
except ModuleNotFoundError:
    yaml = None

ROOT = Path(__file__).resolve().parent.parent
SERVER_DIR = ROOT / "servers"

# Get datapack version from release_meta.yml
with open(Path(__file__).parent / "release_meta.yml") as f:
    if yaml:
        release_meta = yaml.safe_load(f)
    else:
        release_meta = {}
        for line in f:
            key, sep, value = line.partition(":")
            if sep:
                release_meta[key.strip()] = value.strip().strip("\"'")

datapack_version = release_meta["version"]

versions = sorted(
    p.name
    for p in SERVER_DIR.iterdir()
    if p.is_dir()
)

EXTRA_RULES = [
    (Version("1.13"), Version("1.14.4"), "+mc1.13"),
    (Version("1.15"), Version("1.20.1"), "+mc1.15"),
    (Version("1.20.2"), Version("999.999"), "+mc1.20.2"),
]

def get_src_folder(mc_version: str) -> str:
    version = Version(mc_version)

    for start, end, folder in EXTRA_RULES:
        if start <= version <= end:
            return folder

    raise ValueError(f"Unsupported version: {mc_version}")


for version in versions:
    print(f"Deploying version {version}...")
    src_folder = get_src_folder(version)
    datapack_name = f"TPA_Datapack-{datapack_version}{src_folder}"
    print(f"  with datapack version: {datapack_name}")
    dst = SERVER_DIR / version / "world" / "datapacks" / datapack_name
    if dst.exists():
        rmtree(dst)
    copytree(ROOT / "src" / src_folder, dst)
