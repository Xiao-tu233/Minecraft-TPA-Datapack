scoreboard players set @s tpa.player_id 0
tellraw @s {text:"[§6点我打开TPA菜单§r]",click_event:{action:"run_command", command:"/trigger tpa.tpa"}, hover_event:{action:"show_text", value:"§b点击查看TPA菜单"}}
