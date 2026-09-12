"""
This script is used for +mc1.20.2 code -> +mc1.15 code conversion.
It replace structure like 
```mcfunction
some commands here \
    the rest part
```
to
```mcfunction
some commands here the rest part
```
"""

import os

folder = r"D:\TPA_Datapack\Minecraft-TPA-Datapack\src\+mc1.13\data\tpa\functions"  # 改成你的 mcfunction 文件所在目录

for root, dirs, files in os.walk(folder):
    for file in files:
        if file.endswith(".mcfunction"):
            path = os.path.join(root, file)
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()

            # 删除所有 "\\n"
            new_content = content.replace("predicate=tpa:available", "scores={tpa.available=1}")

            with open(path, "w", encoding="utf-8") as f:
                f.write(new_content)

            print("Processed:", path)
