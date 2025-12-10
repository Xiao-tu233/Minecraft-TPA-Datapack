# Parent function: tpa:back
data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos set value []
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.back_got.x
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.back_got.y
data modify storage tpa:tpa temp.teleport.Pos append from storage tpa:tpa temp.back_got.z
data modify storage tpa:tpa temp.teleport.Rotation set value []
data modify storage tpa:tpa temp.teleport.Rotation append from storage tpa:tpa temp.back_got.yaw
data modify storage tpa:tpa temp.teleport.Rotation append from storage tpa:tpa temp.back_got.pitch
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.back_got.Dimension
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {"selector":"@s"}, {"translate":" did back to xyz:(%s, %s, %s) yaw:%s pitch:%s dimension:%s", "with":[{"storage": "tpa:tpa", "nbt":"temp.back_got.x"}, {"storage": "tpa:tpa", "nbt":"temp.back_got.y"}, {"storage": "tpa:tpa", "nbt":"temp.back_got.z"}, {"storage": "tpa:tpa", "nbt":"temp.back_got.yaw"}, {"storage": "tpa:tpa", "nbt":"temp.back_got.pitch"}, {"storage": "tpa:tpa", "nbt":"temp.back_got.Dimension"} ]}]

function tpa:back/push
scoreboard players set #is_back_acting tpa.variables 1
function tpa:teleport/main
function tpa:back/push_confirm
function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.back_act"}, "."]
title @s[scores={tpa.output=0..1}] actionbar [{"storage": "tpa:tpa", "nbt": "loaded_lang.back_act", "color": "gold"}]
