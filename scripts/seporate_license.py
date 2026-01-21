import json
import textwrap

# ===== 配置区域 =====
MAX_CHARS = 256        # Minecraft 1.15 单页最大字符数
MAX_LINES = 14         # 建议最大行数
LINE_WIDTH = 20        # 每行大约字符数（英文 18~22 比较安全）

INPUT_FILE = "license.txt"
OUTPUT_FILE = "pages.json"

# ===================

def split_paragraph(paragraph):
    """把一个段落拆成多行"""
    return textwrap.wrap(
        paragraph,
        width=LINE_WIDTH,
        replace_whitespace=False,
        drop_whitespace=False
    )

def paginate(text):
    pages = []
    current_lines = []
    current_chars = 0

    paragraphs = text.split("\n\n")

    for para in paragraphs:
        lines = split_paragraph(para) or [""]

        for line in lines:
            line_len = len(line) + 1  # +1 for \n

            # 如果加这一行会超限制，就开新页
            if (
                current_chars + line_len > MAX_CHARS
                or len(current_lines) + 1 > MAX_LINES
            ):
                pages.append("\n".join(current_lines))
                current_lines = []
                current_chars = 0

            current_lines.append(line)
            current_chars += line_len

        # 段落结束，加空行
        if current_lines:
            current_lines.append("")
            current_chars += 1

    if current_lines:
        pages.append("\n".join(current_lines))

    return pages

def main():
    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        raw_text = f.read().strip()

    pages = paginate(raw_text)

    # 转成 MC 可用 JSON
    mc_pages = [
        json.dumps({"text": page}, ensure_ascii=False)
        for page in pages
    ]

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("[\n")
        for i, p in enumerate(mc_pages):
            comma = "," if i != len(mc_pages) - 1 else ""
            f.write(f"  {p}{comma}\n")
        f.write("]\n")

    print(f"完成：共 {len(mc_pages)} 页，已输出到 {OUTPUT_FILE}")

if __name__ == "__main__":
    main()