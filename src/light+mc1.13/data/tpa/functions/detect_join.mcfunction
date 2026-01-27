scoreboard players set @s tpa.player_id 0
tellraw @s {"text":"[§6点我打开TPA菜单§r]","clickEvent":{"action":"run_command","value":"/trigger tpa.tpa"},"hoverEvent":{"action":"show_text","value":"§b点击查看TPA菜单"}}
