# Parent Function: tpa:sethome
# @macro: {name: str, id: int}
# {x: int, y: int, z: int, dim: string[Dimension]}
$data remove storage tpa:tpa home.$(name).$(id)
$execute store result storage tpa:tpa home.$(name).$(id).x int 1 run data get entity @s Pos[0]
$execute store result storage tpa:tpa home.$(name).$(id).y int 1 run data get entity @s Pos[1]
$execute store result storage tpa:tpa home.$(name).$(id).z int 1 run data get entity @s Pos[2]
execute store result storage tpa:tpa temp.home.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home.z int 1 run data get entity @s Pos[2]

data modify storage tpa:tpa temp.home.id set from storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
$data modify storage tpa:tpa home.$(name).$(id).dim set from storage tpa:tpa temp.dimension.namespaceid
data modify storage tpa:tpa temp.home.dimension set from storage tpa:tpa temp.dimension.name

data modify storage tpa:tpa temp.home_ set from storage tpa:tpa temp.home
function tpa:home/menu
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_
data remove storage tpa:tpa temp.home_

function tpa:sounds/pick_orb
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_left_part"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.id"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_middle_part"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.dimension"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_position"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.x"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.y"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.z"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_right_part"}, "." \
]
title @s[predicate=tpa:output/show_actionbar] actionbar [ \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_left_part"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.id"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_middle_part"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.dimension"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_position"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.x"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.y"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.home.z"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_set_right_part"}\
]
