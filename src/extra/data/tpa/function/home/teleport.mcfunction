# Parent function: tpa:home/found

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