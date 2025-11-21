function tpa:sounds/levelup
tellraw @a[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.idfix_act_left_part"}, {"selector": "@s", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.lang.idfix_act_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.idfix_act_right_part"}, ". " ]
title @a[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.idfix_act_left_part", "color": "gold"}, {"selector": "@s"},  {"storage":"tpa:tpa", "nbt":"temp.lang.idfix_act_right_part", "color": "gold"} ]
scoreboard players operation @s tpa.idfix_cd = #idfix_cooldown tpa.config
# #global_current is set to 1 instead of 0 is cuz the id starts with 2
scoreboard players set #global_current tpa.player_id 1
scoreboard players set #back_length tpa.variables 0
data remove storage tpa:tpa back
tag @a remove fake_player
scoreboard objectives remove tpa.player_id
scoreboard objectives add tpa.player_id dummy
scoreboard players set @a tpa.tp_to 0
scoreboard players set @a tpa.tp_here 0
execute if score #tp_spec tpa.config matches 0 run scoreboard players set @a[gamemode=spectator] tpa.player_id -1