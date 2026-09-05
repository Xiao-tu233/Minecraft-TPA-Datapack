# Parent Function: tpa:back/available

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.back_act
function tpa:output/standard

function tpa:back/capture
$execute in $(Dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @s ~ ~ ~ ~ ~
function tpa:back/upsert

$execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBack act: teleported ", {selector:"@s"}, {translate: "(UID:§a%s§r)", with: [{score: {name: "#uid", objective: "tpa.variables"}}]}, " to $(x) $(y) $(z) [$(yaw), $(pitch)] in $(Dimension)"]

function tpa:sounds/tp

