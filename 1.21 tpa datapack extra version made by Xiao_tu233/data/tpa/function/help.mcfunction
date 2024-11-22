scoreboard players set @s help 0
execute as @s[scores={language=0}] run tellraw @s "================§bTPA§6 Help Menu§r================"
execute as @s[scores={language=0}] run tellraw @s ["\n[§bTPA§r] The version you currently installed is made on Aug,18th ,2024.",{"text":"(v1.5.0)","hoverEvent":{"action":"show_text","value":"§bIt's the datapack version, not Minecraft version."}}]
execute as @s[scores={language=0}] run tellraw @s "\n[§bTPA§r] This version supports the teleportation between 20 players."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] If you want more players to use tpa, you can change it yourself in the function files."
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] However, it may increase your datapack memory to occupy."
execute as @s[scores={language=0}] run tellraw @s "\n[§bTPA§r] Use /trigger tpaccept 2/3 to toggle always-accept and always-deny tpa request."
execute as @s[scores={language=0}] run tellraw @s "\n[§bTPA§r] Use /trigger tpa to sent your tpa request."
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] Click the button here to open the menu of server language selection of this datapack:",{"text":"[§4LANG MENU§r]","clickEvent":{"action":"run_command","value":"/function tpa:lang/menu"},"hoverEvent":{"action":"show_text","value":{"text":"§bClick here to open the menu of server language selection of this datapack(Operator only)"}}}]
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] To change your own language, use /scoreboard players set #language tpa +id of the language"
execute as @s[scores={language=0}] run tellraw @s "[§bTPA§r] You can also use the menu below to change your own language:"
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] [\n",{"text":" §b0 §rEnglish","clickEvent":{"action":"run_command","value":"/trigger language set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§bSwitch language to English"}}},{"text":"\n §b1 §rSimplified Chinese ","clickEvent":{"action":"run_command","value":"/trigger language set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§b切换语言至简体中文"}}},{"text":" \n §b2 §rTraditional Chinese ","clickEvent":{"action":"run_command","value":"/trigger language set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§b切換語言至繁體中文"}}},"\n]"]
execute as @s[scores={language=0}] run tellraw @s [{"text":"[§4Uninstall§r]","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"text":"§bUninstall this datapack(operator only)"}}}]
execute as @s[scores={language=0}] run tellraw @s "============================================="

execute as @s[scores={language=1}] run tellraw @s "================§bTPA§6 帮助菜单§r================"
execute as @s[scores={language=1}] run tellraw @s ["\n[§bTPA§r] 你现在安装的数据包在2024年8月18日更新的版本.",{"text":"(v1.5.0)","hoverEvent":{"action":"show_text","value":"§b这是数据包版本, 不是Minecraft版本. "}}]
execute as @s[scores={language=1}] run tellraw @s "\n[§bTPA§r] 此版本仅支持20个玩家之间的传送."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 如果你需要更多玩家使用tpa, 你可以在函数文件里自行更改."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 但是这可能会增加数据包的内存占用"
execute as @s[scores={language=1}] run tellraw @s "\n[§bTPA§r] 使用 /trigger tpaccept 2/3 来切换是否开启/关闭永远同意传送请求."
execute as @s[scores={language=1}] run tellraw @s "\n[§bTPA§r] 使用 /trigger tpa 来发送你的传送请求."
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 使用指令 /trigger language set +语言代号 来改变个人语言"
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 点击这里的按钮来打开该数据包的服务器语言切换菜单:",{"text":"[§4语言菜单§r]","clickEvent":{"action":"run_command","value":"/function tpa:lang/menu"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击这里来打开服务器语言切换菜单(仅管理员)"}}}]
execute as @s[scores={language=1}] run tellraw @s "[§bTPA§r] 你也可以使用下方的菜单来切换个人语言:"
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] [\n",{"text":" §b0 §r英语","clickEvent":{"action":"run_command","value":"/trigger language set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§bSwitch language to English"}}},{"text":"\n §b1 §r简体中文 ","clickEvent":{"action":"run_command","value":"/trigger language set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§b切换语言至简体中文"}}},{"text":" \n §b2 §r繁体中文 ","clickEvent":{"action":"run_command","value":"/trigger language set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§b切換語言至繁體中文"}}},"\n]"]
execute as @s[scores={language=1}] run tellraw @s [{"text":"[§4卸载§r]","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"text":"§b卸载该数据包(仅管理员)"}}}]
execute as @s[scores={language=1}] run tellraw @s "============================================="

execute as @s[scores={language=2}] run tellraw @s "================§bTPA§6 幫助菜單§r================"
execute as @s[scores={language=2}] run tellraw @s ["\n[§bTPA§r]你現在安裝的數据包在2024年8月18日更新的版本.",{"text":"(v1.5.0)","hoverEvent":{"action":"show_text","value":"§b這是資料包版本,不是Minecraft版本."}}]
execute as @s[scores={language=2}] run tellraw @s "\n[§bTPA§r] 此版本僅支援20個玩家之間的傳送."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 如果你需要更多玩家之間的傳送tpa, 你可以在函數檔案中自行更改."
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 但這可能會增加資料包的記憶體佔用"
execute as @s[scores={language=2}] run tellraw @s "\n[§bTPA§r] 使用/trigger tpaccept 2/3 來切換是否開啟/關閉永遠同意傳送請求."
execute as @s[scores={language=2}] run tellraw @s "\n[§bTPA§r] 使用 /trigger tpa 來發送你的傳送請求."
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 點擊這裡的按鈕來打開該資料包伺服器語言切換菜單:",{"text":"[§4語言菜單§r]","clickEvent":{"action":"run_command","value":"/function tpa:lang/menu"},"hoverEvent":{"action":"show_text","value":{"text":"§b點擊這裡來打開伺服器語言切換菜單(僅管理員)"}}}]
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 使用指令 /trigger language set +語言代號 來更改個人語言"
execute as @s[scores={language=2}] run tellraw @s "[§bTPA§r] 你也可以使用下方的菜單來切換個人語言:"
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] [\n",{"text":" §b0 §r英語","clickEvent":{"action":"run_command","value":"/trigger language set 0"},"hoverEvent":{"action":"show_text","value":{"text":"§bSwitch language to English"}}},{"text":"\n §b1 §r簡體中文 ","clickEvent":{"action":"run_command","value":"/trigger language set 1"},"hoverEvent":{"action":"show_text","value":{"text":"§b切换语言至简体中文"}}},{"text":" \n §b2 §r繁体中文 ","clickEvent":{"action":"run_command","value":"/trigger language set 2"},"hoverEvent":{"action":"show_text","value":{"text":"§b切換語言至繁體中文"}}},"\n]"]
execute as @s[scores={language=2}] run tellraw @s [{"text":"[§4卸載§r]","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"text":"§b卸載該資料包(僅管理員)"}}}]
execute as @s[scores={language=2}] run tellraw @s "============================================="