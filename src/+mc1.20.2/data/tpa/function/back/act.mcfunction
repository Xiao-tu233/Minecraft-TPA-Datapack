# Parent Function: tpa:back/available

function tpa:back/set

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {selector:"@s"}, {translate:" triggered BACK to (%s, %s, %s) yaw:%s pitch:%s dimension:%s", with:[\
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.x"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.y"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.z"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.yaw"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.pitch"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.dimension"} \
]}]

function tpa:sounds/tp

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.back_act
function tpa:output/standard

$execute in $(Dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @s ~ ~ ~ ~ ~