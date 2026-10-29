# Parent Function: tpa:back/available

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.back_act
function tpa:output/standard

function tpa:back/capture

data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos set value [0.0d, 0.0d, 0.0d]
data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Pos[0] set from storage tpa:tpa temp.back_result.x
data modify storage tpa:tpa temp.teleport.Pos[1] set from storage tpa:tpa temp.back_result.y
data modify storage tpa:tpa temp.teleport.Pos[2] set from storage tpa:tpa temp.back_result.z
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.back_result.dimension
data modify storage tpa:tpa temp.teleport.Rotation[0] set from storage tpa:tpa temp.back_result.yaw
data modify storage tpa:tpa temp.teleport.Rotation[1] set from storage tpa:tpa temp.back_result.pitch
function tpa:teleport/main
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBack act: teleported ", {selector:"@s"}, {translate: "(UID:§a%s§r) to %s %s %s [%s, %s] in %s", with: [{score: {name: "#uid", objective: "tpa.variables"}}, {storage: "tpa:tpa", nbt: "temp.back_result.x"}, {storage: "tpa:tpa", nbt: "temp.back_result.y"}, {storage: "tpa:tpa", nbt: "temp.back_result.z"}, {storage: "tpa:tpa", nbt: "temp.back_result.yaw"}, {storage: "tpa:tpa", nbt: "temp.back_result.pitch"}, {storage: "tpa:tpa", nbt: "temp.back_result.dimension"}]}]

function tpa:back/upsert

function tpa:sounds/tp
