# Called by: (player) Any OP, quoted by: tpa:warp/menu

# {x: int, y: int, z: int, dim: string[Dimension], name: str, desc: str, disabled: boolean}
execute store result score #warp tpa.config run data get storage tpa:tpa warp
data modify storage tpa:tpa warp append value {disabled: 0b}
execute store result storage tpa:tpa warp[-1].index int 1 run scoreboard players get #warp tpa.config

data modify storage tpa:tpa warp[-1].dim set from entity @s Dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.dimension.name

execute store result storage tpa:tpa warp[-1].x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa warp[-1].y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa warp[-1].z int 1 run data get entity @s Pos[2]

data modify storage tpa:tpa warp[-1].name set from storage tpa:tpa loaded_lang.warp_set_default_name
data modify storage tpa:tpa warp[-1].desc set value ""
execute unless data storage tpa:tpa warp[-1].disabled run data modify storage tpa:tpa warp[-1].disabled set value 0b

data modify storage tpa:tpa temp.args_ set from storage tpa:tpa temp.args
function tpa:warp/option
data modify storage tpa:tpa temp.args set from storage tpa:tpa temp.args_
tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_left_part"}, {"storage":"tpa:tpa", "nbt":"temp.args.name"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_middle_part"}, {"storage":"tpa:tpa", "nbt":"temp.args.dimension"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_position"}, {"storage":"tpa:tpa", "nbt":"temp.args.x"}, " ", {"storage":"tpa:tpa", "nbt":"temp.args.y"}, " ", {"storage":"tpa:tpa", "nbt":"temp.args.z"}, " ", {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_right_part"}, "." ]