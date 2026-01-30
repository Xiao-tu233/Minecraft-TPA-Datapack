import os
import shutil

# ===== 配置区 =====
input_dir = r"functions"     # 原文件夹
output_dir = r"..\src\+mc1.20.2\format_26_1\data\tpa\function"   # 输出文件夹
target = "{storage: "
replacement = "{interpret: true, storage: "
# =================

os.makedirs(output_dir, exist_ok=True)

for root, _, files in os.walk(input_dir):
    for filename in files:
        src_path = os.path.join(root, filename)

        # 只处理文本文件（可按需删掉这个判断）
        if not filename.endswith((".mcfunction", ".json", ".txt", ".yml")):
            continue

        with open(src_path, "r", encoding="utf-8") as f:
            content = f.read()

        if target in content:
            new_content = content.replace(target, replacement)

            # 保持原目录结构
            rel_path = os.path.relpath(src_path, input_dir)
            dst_path = os.path.join(output_dir, rel_path)
            os.makedirs(os.path.dirname(dst_path), exist_ok=True)

            with open(dst_path, "w", encoding="utf-8") as f:
                f.write(new_content)

            print(f"✔ 已替换并复制: {rel_path}")
