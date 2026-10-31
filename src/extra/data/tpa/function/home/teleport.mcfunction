# Parent function: tpa:home/has_home

function tpa:back/set
data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos set value [0.0d, 0.0d, 0.0d]
data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Pos[0] set from storage tpa:tpa temp.home_result.x
data modify storage tpa:tpa temp.teleport.Pos[1] set from storage tpa:tpa temp.home_result.y
data modify storage tpa:tpa temp.teleport.Pos[2] set from storage tpa:tpa temp.home_result.z
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.home_result.dimension
data modify storage tpa:tpa temp.teleport.Rotation set from entity @s Rotation
function tpa:teleport/main

function tpa:sounds/tp
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_act
execute store result storage tpa:tpa temp.output.arg int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.arg_hover set value ""
function tpa:output/one_arg
