function tpa:sounds/levelup
tellraw @a[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector": "@s", "hoverEvent": {"action": "show_text", "value": {"text": "§b这名玩家使用了ID修复"}}}, {"text": "使用了§aID修复§r, 所有玩家的数据包ID与上一位置已被重置"}, ". " ]
title @a[scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector": "@s"},  {"text": "使用了§aID修复§r, 所有玩家的数据包ID与上一位置已被重置", "color": "gold"} ]

scoreboard players operation @s tpa.idfix_cd = #idfix_cooldown tpa.config

scoreboard objectives remove tpa.player_id
scoreboard objectives add tpa.player_id dummy
scoreboard players set #global_current tpa.player_id 2
execute if score #compact_ids tpa.config matches 0 as @a[scores={tpa.available=1}] run scoreboard players operation @s tpa.player_id = @s tpa.uid
execute if score #compact_ids tpa.config matches 1 as @a[scores={tpa.available=1}] run scoreboard players set @s tpa.player_id 1
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0