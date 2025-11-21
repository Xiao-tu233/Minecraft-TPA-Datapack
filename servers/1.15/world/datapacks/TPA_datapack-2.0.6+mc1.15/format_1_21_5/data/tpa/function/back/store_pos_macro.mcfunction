# Parent Function: tpa:back/store_pos

$data remove storage tpa:tpa back.$(id)
# data modify storage tpa:tpa back.$(id) set value {\
#     x: "PLACEHOLDER", \
#     y: "PLACEHOLDER", \
#     z: "PLACEHOLDER", \
#     yaw: "PLACEHOLDER", \
#     pitch: "PLACEHOLDER", \
#     Dimension: "PLACEHOLDER" \
# }
$data modify storage tpa:tpa back.$(id).x set from entity @s Pos[0]
$data modify storage tpa:tpa back.$(id).y set from entity @s Pos[1]
$data modify storage tpa:tpa back.$(id).z set from entity @s Pos[2]
$data modify storage tpa:tpa back.$(id).yaw set from entity @s Rotation[0]
$data modify storage tpa:tpa back.$(id).pitch set from entity @s Rotation[1]
$data modify storage tpa:tpa back.$(id).Dimension set from entity @s Dimension

execute if score #debug_mode tpa.config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow showing: §adata storage tpa:tpa back:"
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §a ", {storage:"tpa:tpa",nbt:"back"}]