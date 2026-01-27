tellraw @a ["[§bTPA§r] 正在卸载数据包.. (0/1)"]

tellraw @a ["[§bTPA§r] 正在移除所有积分项和标签... (0/1)"]
scoreboard objectives remove tpa.tpa 
scoreboard objectives remove tpa.player_id
scoreboard objectives remove tpa.idfix
scoreboard objectives remove tpa.help
tag @a remove not_match
tag @a remove to_modify
tellraw @a ["[§bTPA§r] 成功移除. (1/1)"]
datapack disable "file/TPA_datapack-2.0.6-light+mc1.21.5.zip"
datapack disable "file/TPA_datapack-2.0.6-light+mc1.21.5"
tellraw @a ["[§bTPA§r] §a成功卸载. 使用 ", {text:"§n/datapack enable \"file/TPA_datapack-2.0.6+mc1.21.5\"", click_event: {action: "run_command", command: "/datapack enable \"file/TPA_datapack-2.0.6-light+mc1.21.5\""}, hover_event: {action: "show_text", value: "点击运行命令"}},"来再次启用."]