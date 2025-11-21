import json
import shutil
from pathlib import Path

# 读取 spyglass.json
with open("spyglass.json", "r", encoding="utf-8") as f:
    data = json.load(f)
game_version = data["env"]["gameVersion"]

# 定义源和目标目录
if game_version in ["1.20.2", "1.20.2", "1.20.3", "1.20.5", "1.21.2", "1.21.5", "1.21.6", "1.21.9", "1.21.11"]:
    src = Path("src") / "+mc1.20.2"
elif game_version in ["1.15", "1.16", "1.17", "1.20.1"]:
    src = Path("src") / "+mc1.15"
elif game_version in ["1.13", "1.14"]:
    src = Path("src") / "+mc1.13"
else:
    src = Path("src") / "+mc1.20.2"
target = Path("servers") / game_version / "world" / "datapacks" / "TPA_datapack"

# 创建目标目录（如果不存在）
target.mkdir(parents=True, exist_ok=True)

# 同步文件夹（先清空目标，再复制）
if target.exists():
    shutil.rmtree(target)
shutil.copytree(src, target)

print(f"✅ Synced {src} → {target}")
