# Called by: (player) Any OP, quoted by: tpa:warp/show_each_macro, tpa:warp/show_add
# @macro_param: {index: int}
# {x: int, y: int, z: int, dim: string[Dimension], name: str, desc: str, disabled: boolean}
$execute unless data storage tpa:tpa warp[$(index)] run data modify storage tpa:tpa warp append value {}

# Refresh warp count: warp = len(warp) - 1
execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

$data modify storage tpa:tpa warp[$(index)].dim set from entity @s Dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.dimension.name

$execute store result storage tpa:tpa warp[$(index)].x int 1 run data get entity @s Pos[0]
$execute store result storage tpa:tpa warp[$(index)].y int 1 run data get entity @s Pos[1]
$execute store result storage tpa:tpa warp[$(index)].z int 1 run data get entity @s Pos[2]
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2]

$execute unless data storage tpa:tpa warp[$(index)].name run data modify storage tpa:tpa warp[$(index)].name set from storage tpa:tpa loaded_lang.warp_set_default_name
$execute unless data storage tpa:tpa warp[$(index)].desc run data modify storage tpa:tpa warp[$(index)].desc set value ""
$execute unless data storage tpa:tpa warp[$(index)].disabled run data modify storage tpa:tpa warp[$(index)].disabled set value 0b

$data modify storage tpa:tpa temp.args.name set from storage tpa:tpa warp[$(index)].name
$data modify storage tpa:tpa temp.args.desc set from storage tpa:tpa warp[$(index)].desc

data modify storage tpa:tpa temp.args_ set from storage tpa:tpa temp.args
function tpa:warp/option
data modify storage tpa:tpa temp.args set from storage tpa:tpa temp.args_
tellraw @s [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_set_left_part"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.args.name"}, \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_set_middle_part"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.args.dimension"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_set_position"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.args.x"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.args.y"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"temp.args.z"}, " ", \ 
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_set_right_part"}, "." \
]