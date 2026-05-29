# Called by: (player) Any OP, quoted by: tpa:warp/menu
# @macro_param: {index: int}
# {x: int, y: int, z: int, dim: string[Dimension], name: str, desc: str, disabled: boolean}

# Refresh warp count: warp = len(warp) - 1
execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

data modify storage tpa:tpa temp.editted_warp.dim set from entity @s Dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.dimension.name

execute store result storage tpa:tpa temp.editted_warp.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.editted_warp.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.editted_warp.z int 1 run data get entity @s Pos[2]
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2]
function tpa:warp/option