# Parent Function: tpa:back

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {selector:"@s"}, {translate:" did back to xyz:(%s, %s, %s) yaw:%s pitch:%s dimension:%s", with:[\
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.x"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.y"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.z"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.yaw"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.pitch"}, \
    {interpret: true, storage: "tpa:tpa", nbt:"temp.back.dimension"} \
]}]
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.back_act"}, "."\
]
title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.back_act", color: "gold"}]
$execute in $(Dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @s ~ ~ ~ ~ ~