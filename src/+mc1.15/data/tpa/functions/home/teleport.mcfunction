data remove storage tpa:tpa temp.teleport
# x = (double)x; y = (double)y; z = (double)z;

execute store result score #home.x tpa.variables run data get storage tpa:tpa temp.home.x
execute store result score #home.z tpa.variables run data get storage tpa:tpa temp.home.z

scoreboard players operation #home.x tpa.variables *= #2 tpa.variables
scoreboard players add #home.x tpa.variables 1
scoreboard players operation #home.z tpa.variables *= #2 tpa.variables
scoreboard players add #home.z tpa.variables 1
execute store result storage tpa:tpa temp.home.x double 0.5 run scoreboard players get #home.x tpa.variables
execute store result storage tpa:tpa temp.home.y double 1 run data get storage tpa:tpa temp.home.y
execute store result storage tpa:tpa temp.home.z double 0.5 run scoreboard players get #home.z tpa.variables

data modify storage tpa:tpa temp.teleport.Pos set value []
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.home.x
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.home.y
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.home.z
data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.home.dim
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {"selector":"@s"}, {"translate":" executed home teleport to xyz:(%s, %s, %s) dimension:%s", "with":[{"storage": "tpa:tpa", "nbt":"temp.home.x"}, {"storage": "tpa:tpa", "nbt":"temp.home.y"}, {"storage": "tpa:tpa", "nbt":"temp.home.z"}, {"storage": "tpa:tpa", "nbt":"temp.home.dim"} ]}]

function tpa:back/push_confirm
function tpa:teleport/main
function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_act_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_act_right_part"}, ". " ]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.home_act_left_part", "color": "gold"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "gold"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_act_right_part", "color": "gold"}]

