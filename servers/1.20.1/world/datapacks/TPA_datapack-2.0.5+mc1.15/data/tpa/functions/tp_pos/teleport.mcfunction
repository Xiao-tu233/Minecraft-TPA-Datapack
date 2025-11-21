data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos set value []

scoreboard players operation #tp_pos.x tpa.variables = @s tpa.pos.x_temp
scoreboard players operation #tp_pos.z tpa.variables = @s tpa.pos.z_temp

scoreboard players operation #tp_pos.x tpa.variables *= #2 tpa.variables
scoreboard players add #tp_pos.x tpa.variables 1
scoreboard players operation #tp_pos.z tpa.variables *= #2 tpa.variables
scoreboard players add #tp_pos.z tpa.variables 1
execute store result storage tpa:tpa temp.tp_pos.x double 0.5 run scoreboard players get #tp_pos.x tpa.variables
execute store result storage tpa:tpa temp.tp_pos.y double 1 run scoreboard players get @s tpa.pos.y_temp
execute store result storage tpa:tpa temp.tp_pos.z double 0.5 run scoreboard players get #tp_pos.z tpa.variables

data modify storage tpa:tpa temp.teleport.Pos set value []
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.tp_pos.x
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.tp_pos.y
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.tp_pos.z
data modify storage tpa:tpa temp.teleport.Rotation set from entity @s Rotation
data modify storage tpa:tpa temp.teleport.Dimension set from entity @s Dimension
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {"selector":"@s"}, {"translate":" executed tp_pos teleport to xyz:(%s, %s, %s) dimension:%s", "with":[{"storage": "tpa:tpa", "nbt":"temp.tp_pos.x"}, {"storage": "tpa:tpa", "nbt":"temp.tp_pos.y"}, {"storage": "tpa:tpa", "nbt":"temp.tp_pos.z"}, {"entity": "@s", "nbt":"Dimension"} ]}]

function tpa:back/push
function tpa:teleport/main
function tpa:back/push_confirm
function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_left_part"}, {"score": {"name": "@s", "objective": "tpa.pos.x_temp"}}," ", {"score": {"name": "@s", "objective": "tpa.pos.y_temp"}}," ", {"score": {"name": "@s", "objective": "tpa.pos.z_temp"}}, {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_right_part"}, "."]
title @s[scores={tpa.output=0..1}] actionbar [{"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_left_part", "color": "gold"}, {"score": {"name": "@s", "objective": "tpa.pos.x_temp"}}," ", {"score": {"name": "@s", "objective": "tpa.pos.y_temp"}}," ", {"score": {"name": "@s", "objective": "tpa.pos.z_temp"}}, {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_right_part", "color": "gold"}]

scoreboard players operation @s tpa.pos_cd = #tp_pos_cooldown tpa.config