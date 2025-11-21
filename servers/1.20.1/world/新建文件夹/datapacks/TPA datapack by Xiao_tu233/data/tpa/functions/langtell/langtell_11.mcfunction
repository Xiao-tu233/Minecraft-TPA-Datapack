#> tpa:langtell/langtell_11.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_11"
playsound minecraft:entity.player.levelup ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s "=======================§bTPA§6 Help Menu§r======================"
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] This datapack is made by Xiao_tu233. This datapack cannot be used for commercial use. [§bTPA§r] Copyright © Xiao_tu233 2024 All rights reserved."
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] If you met some bugs, click ",{"text":"§bHERE","clickEvent":{"action":"open_url","value":"https://discord.gg/QgkpxsFahw"},"hoverEvent":{"action":"show_text","value":{"text":"§bClick to contact us on discord"}}}," to contact us on discord to report bugs."]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] The version you currently installed is made on Nov.30th,2024.",{"text":"(v2.0.0)","hoverEvent":{"action":"show_text","value":"§bIt's the datapack version, not Minecraft version."}}]
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] This datapack version supports custom language for users to write in the function tpa:langtell"
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you want to read the language you speak in this datapack, you can just modify it in the function follow the format."
execute as @s[scores={language=0}] run tellraw @s ["======================( ", {"text":"§b<§r","hoverEvent":{"action":"show_text","value":{"text":"§bNo previous page."}}}, " 1/2 ", {"text":"§b>§r","clickEvent":{"action":"run_command","value":"/trigger help set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§bturn to next page(2/2)"}}}, " )======================"]

execute as @s[scores={language=1}] run tellraw @s "======================§bTPA§6 帮助菜单§r====================="
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 此数据包由 Xiao_tu233 制作. 此数据包不可以被用作商业用途. [§bTPA§r] Copyright © Xiao_tu233 2024 保留所有版权."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 如果你遇到了漏洞, 点击 ",{"text":"§b这里","clickEvent":{"action":"open_url","value":"http://qm.qq.com/cgi-bin/qm/qr?group_code=814709389"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击来加入QQ群"}}}," 或者 ",{"text":"§b这里","clickEvent":{"action":"copy_to_clipboard","value":"814709389"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击来复制QQ群群号"}}}," 在QQ群联系我们来报告漏洞"]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你现在安装的数据包在2024年11月30日更新的版本.",{"text":"(v2.0.0)","hoverEvent":{"action":"show_text","value":"§b这是数据包版本, 不是Minecraft版本. "}}]
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 此数据包版本支持用户在函数 tpa:langtell 中自定义语言."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你需要在该数据包中看到你所使用的语言, 你可以在函数文件中仿照格式自行更改."
execute as @s[scores={language=1}] run tellraw @s ["======================( ", {"text":"§b<§r","hoverEvent":{"action":"show_text","value":{"text":"§b这是第一页."}}}, " 1/2 ", {"text":"§b>§r","clickEvent":{"action":"run_command","value":"/trigger help set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§b查看下一页(2/2)"}}}, " )======================"]

execute as @s[scores={language=2}] run tellraw @s "======================§bTPA§6 幫助選單§r====================="
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 此資料包由 Xiao_tu233 制作. 此資料包不可以被用作商業用途. [§bTPA§r] Copyright © Xiao_tu233 2024 保留所有版權."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 如果你遇到了漏洞, 單擊 ",{"text":"§b這裡","clickEvent":{"action":"open_url","value":"https://discord.gg/QgkpxsFahw"},"hoverEvent":{"action":"show_text","value":{"text":"§b單擊來在Discord聯繫我們"}}}," 在Discord上聯繫我們来报告漏洞"]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r]你現在安裝的資料包在2024年11月30日更新的版本.",{"text":"(v2.0.0)","hoverEvent":{"action":"show_text","value":"§b這是資料包版本,不是Minecraft版本."}}]
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 此資料包版本支援用戶在函数 tpa:langtell 中自定义語言."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你需要在該資料包中看到你所使用的語言，你可以在函數檔案中仿照格式自行更改."
execute as @s[scores={language=2}] run tellraw @s ["======================( ", {"text":"§b<§r","hoverEvent":{"action":"show_text","value":{"text":"§b這是第一頁."}}}, " 1/2 ", {"text":"§b>§r","clickEvent":{"action":"run_command","value":"/trigger help set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§b查看下一頁(2/2)"}}}, " )======================"]

#custom language here
execute as @s[scores={language=3}] run tellraw @s "================§bTPA§6 <Text here>§r================"
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]
execute as @s[scores={language=3}] run tellraw @s ["======================( ", {"text":"§b<§r","hoverEvent":{"action":"show_text","value":{"text":"§b<Text here>"}}}, " 1/2 ", {"text":"§b>§r","clickEvent":{"action":"run_command","value":"/trigger help set 2"},"hoverEvent":{"action":"show_text","value":{"text":"<Text here>(2/2)"}}}, " )======================"]
