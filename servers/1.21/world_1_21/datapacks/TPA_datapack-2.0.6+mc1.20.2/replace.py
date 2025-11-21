import os
import re

def replace_text_in_files(folder_path):
    """
    在指定文件夹及其子文件夹中的所有文件中执行文本替换
    
    Args:
        folder_path (str): 要处理的文件夹路径
    """
    
    # 定义替换规则
    replacements = [
        # 第一个替换：@n[ -> @e[sort=nearest, limit=1
        (r'@n\[', '@e[sort=nearest, limit=1, '),
        
        # 第二个替换：@n -> @e[sort=nearest, limit=1]
        (r'@n(?!\[)', '@e[sort=nearest, limit=1]')
    ]
    
    # 统计信息
    files_processed = 0
    total_replacements = 0
    
    # 遍历文件夹及其所有子文件夹
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            
            try:
                # 读取文件内容
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                original_content = content
                file_replacements = 0
                
                # 执行所有替换
                for pattern, replacement in replacements:
                    new_content, count = re.subn(pattern, replacement, content)
                    content = new_content
                    file_replacements += count
                
                # 如果内容有变化，写入文件
                if content != original_content:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(content)
                    
                    files_processed += 1
                    total_replacements += file_replacements
                    print(f"已处理: {file_path} (替换了 {file_replacements} 处)")
                        
            except Exception as e:
                print(f"处理文件时出错 {file_path}: {e}")
    
    print(f"\n处理完成！")
    print(f"共处理了 {files_processed} 个文件")
    print(f"总共进行了 {total_replacements} 处替换")

def main():
    # 获取用户输入的文件夹路径
    folder_path = "format_1_20_5/data/tpa/functions"
    
    # 检查路径是否存在
    if not os.path.exists(folder_path):
        print("错误：指定的文件夹路径不存在！")
        return
    
    if not os.path.isdir(folder_path):
        print("错误：指定的路径不是一个文件夹！")
        return
    
    # 确认操作
    print(f"即将处理文件夹: {folder_path}")
    print("这将执行以下替换:")
    print("1. @n[ -> @e[sort=nearest, limit=1, ")
    print("2. @n -> @e[sort=nearest, limit=1]")
    confirm = input("确定要继续吗？(y/N): ").strip().lower()
    
    if confirm in ['y', 'yes']:
        replace_text_in_files(folder_path)
    else:
        print("操作已取消")

if __name__ == "__main__":
    main()