# Parent Function: tpa:sethome
# @macro: {name: str, id: int}
# {x: int, y: int, z: int, dim: string[Dimension]}
$data remove storage tpa:tpa home.$(name).$(id)
$execute store result storage tpa:tpa home.$(name).$(id).x int 1 run data get entity @s Pos[0]
$execute store result storage tpa:tpa home.$(name).$(id).y int 1 run data get entity @s Pos[1]
$execute store result storage tpa:tpa home.$(name).$(id).z int 1 run data get entity @s Pos[2]
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2]

data remove storage tpa:tpa temp.string_map
data modify storage tpa:tpa temp.string_map set value {"minecraft:overworld": 0b, "minecraft:the_nether": -1b, "minecraft:the_end": 1b}
data remove storage tpa:tpa temp.args.src
data modify storage tpa:tpa temp.args.src set from entity @s Dimension
execute store result score #dim tpa.variables run function tpa:string_map with storage tpa:tpa temp.args

$execute if score #dim tpa.variables matches 1 run data modify storage tpa:tpa home.$(name).$(id).dim set value 'the_end'
$execute if score #dim tpa.variables matches 0 run data modify storage tpa:tpa home.$(name).$(id).dim set value 'overworld'
$execute if score #dim tpa.variables matches -1 run data modify storage tpa:tpa home.$(name).$(id).dim set value 'the_nether'

execute if score #dim tpa.variables matches 1 run data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.lang.home_set_the_end
execute if score #dim tpa.variables matches 0 run data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.lang.home_set_overworld
execute if score #dim tpa.variables matches -1 run data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.lang.home_set_the_nether

function tpa:sounds/pick_orb
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, \ 
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_left_part"}, \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.id"}, \ 
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_middle_part"}, \
    {"storage":"tpa:tpa", "nbt":"temp.args.dimension"}, \
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_position"}, \
    {"storage":"tpa:tpa", "nbt":"temp.args.x"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.y"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.z"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_right_part"}, "." \
]
title @s[scores={tpa.output=0..1}] actionbar [ \
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_left_part"}, \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.id"}, \ 
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_middle_part"}, \
    {"storage":"tpa:tpa", "nbt":"temp.args.dimension"}, \
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_position"}, \
    {"storage":"tpa:tpa", "nbt":"temp.args.x"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.y"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.args.z"}, " ", \ 
    {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_right_part"}\
]
