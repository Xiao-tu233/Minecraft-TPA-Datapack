# Parent Function: tpa:back

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {"selector":"@s"}, {"translate":" did back to xyz:(%s, %s, %s) yaw:%s pitch:%s dimension:%s", "with":[\
    {storage: "tpa:tpa", nbt:"temp.back.x"}, \
    {storage: "tpa:tpa", nbt:"temp.back.y"}, \
    {storage: "tpa:tpa", nbt:"temp.back.z"}, \
    {storage: "tpa:tpa", nbt:"temp.back.yaw"}, \
    {storage: "tpa:tpa", nbt:"temp.back.pitch"}, \
    {storage: "tpa:tpa", nbt:"temp.back.dimension"} \
]}]
function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [\
    {storage: "tpa:tpa", nbt: "temp.lang.header"}, \
    {storage: "tpa:tpa", nbt: "temp.lang.back_act"}, "."\
]
title @s[scores={tpa.output=0..1}] actionbar [{storage: "tpa:tpa", nbt: "temp.lang.back_act", color: "gold"}]
$execute in $(Dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @s ~ ~ ~ ~ ~