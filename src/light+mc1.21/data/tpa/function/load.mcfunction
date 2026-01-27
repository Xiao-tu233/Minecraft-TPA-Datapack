tellraw @a ["[§bTPA§r] §e重载数据包中..."]
tellraw @a ["[§bTPA§r] 添加数据包积分项... (0/2)"]
scoreboard objectives add tpa trigger "TPA菜单/传送请求目标"
scoreboard objectives add tpa.tpa trigger "传送请求目标"
scoreboard objectives add tpa.idfix trigger "ID修复"
scoreboard objectives add tpa.player_id dummy
scoreboard objectives add tpa.help trigger "帮助"
scoreboard players set #global_current tpa.player_id 1
tellraw @a ["[§bTPA§r] 成功添加. (1/2)"]
tellraw @a ["[§bTPA§r] 移除标签中... (1/2)"]
tag @a remove not_match
tag @a remove to_modify
tellraw @a ["[§bTPA§r] 成功移除标签. (2/2)"]
tellraw @a ["[§bTPA§r] §a数据包重载完成: §r1.21 - 1.21.4 轻量版 ",{"text":"v2.0.6","hoverEvent":{"action":"show_text","value":"§b这是TPA数据包的版本, 而不是Minecraft版本."}}]
tellraw @a ["[§bTPA§r] ", {"text": "欢迎使用TPA数据包! "}]
tellraw @a ["[§bTPA§r] ", {"text": "Copyright © 2024-2025 Xiao_tu233. 不允许商业使用. 具体请点击下方\"[协议]\"按钮"}]
tellraw @a ["[§bTPA§r] ", {"text": "此数据包由§6Xiao_tu233§r制作. "}]
tellraw @a ["[§bTPA§r] 如果你遇到了漏洞, 点击 ",{"text":"§b这里","clickEvent":{"action":"open_url","value":"http://qm.qq.com/cgi-bin/qm/qr?group_code=814709389"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击来加入QQ群"}}}," 或者 ",{"text":"§b这里","clickEvent":{"action":"copy_to_clipboard","value":"814709389"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击来复制QQ群群号"}}}," 在QQ群联系我们来报告漏洞"]
tellraw @a ["[§bTPA§r] 更新数据包在",{"text":"§0Github","hoverEvent":{"action":"show_text","value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"},"clickEvent":{"action":"open_url","value":"https://github.com/Xiao-tu233/Minecraft-TPA-Datapack"}}]
tellraw @a ["[§bTPA§r] 点击来卸载数据包: ",{"text":"[§4卸载§r]","clickEvent":{"action":"run_command","value":"/function tpa:uninstall"},"hoverEvent":{"action":"show_text","value":{"text":"§b点击卸载"}}}]