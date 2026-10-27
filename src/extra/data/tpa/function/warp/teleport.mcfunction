# Parent function: tpa:warp/within_range
# @macro: {dimension: str, x: int, y: int, z: int}
function tpa:back/set

data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos[0] set from storage tpa:tpa temp.warp_result.x
data modify storage tpa:tpa temp.teleport.Pos[1] set from storage tpa:tpa temp.warp_result.y
data modify storage tpa:tpa temp.teleport.Pos[2] set from storage tpa:tpa temp.warp_result.z
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.warp_result.dimension
data modify storage tpa:tpa temp.teleport.Rotation set from entity @s Rotation
function tpa:teleport/main

function tpa:sounds/tp

# Output
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_teleport
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.warp_result.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa temp.warp_result.desc
function tpa:output/one_arg
