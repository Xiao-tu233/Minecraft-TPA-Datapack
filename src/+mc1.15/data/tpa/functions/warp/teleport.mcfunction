# Parent function: tpa:warp

data remove storage tpa:tpa temp.teleport
# x = (double)x; y = (double)y; z = (double)z;

execute store result score #warp.x tpa.variables run data get storage tpa:tpa temp.warp.x
execute store result score #warp.z tpa.variables run data get storage tpa:tpa temp.warp.z

scoreboard players operation #warp.x tpa.variables *= #2 tpa.variables
scoreboard players add #warp.x tpa.variables 1
scoreboard players operation #warp.z tpa.variables *= #2 tpa.variables
scoreboard players add #warp.z tpa.variables 1
execute store result storage tpa:tpa temp.warp.x double 0.5 run scoreboard players get #warp.x tpa.variables
execute store result storage tpa:tpa temp.warp.y double 1 run data get storage tpa:tpa temp.warp.y
execute store result storage tpa:tpa temp.warp.z double 0.5 run scoreboard players get #warp.z tpa.variables

data modify storage tpa:tpa temp.teleport.Pos set value []
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.warp.x
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.warp.y
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.warp.z
data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.warp.dim
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {"selector":"@s"}, {"translate":" executed warp teleport to xyz:(%s, %s, %s) dimension:%s", "with":[{"storage": "tpa:tpa", "nbt":"temp.warp.x"}, {"storage": "tpa:tpa", "nbt":"temp.warp.y"}, {"storage": "tpa:tpa", "nbt":"temp.warp.z"}, {"storage": "tpa:tpa", "nbt":"temp.warp.dim"} ]}]

function tpa:back/push_confirm
function tpa:teleport/main
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_teleport_left_part"}, {"storage": "tpa:tpa", "nbt": "temp.warp.name", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "temp.warp.desc"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_teleport_right_part"}, ". " ]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.warp_teleport_left_part", "color": "gold"}, {"storage": "tpa:tpa", "nbt": "temp.warp.name", "color": "gold"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_teleport_right_part", "color": "gold"}]