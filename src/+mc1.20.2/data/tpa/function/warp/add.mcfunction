# Called by: (Player) Any OP, quoted by: tpa:warp/menu

function tpa:load_lang

execute store result score #warp.index tpa.variables run data get storage tpa:tpa warp

data modify storage tpa:tpa warp append value {disabled: 0b, desc: ""}
execute store result storage tpa:tpa warp[-1].x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa warp[-1].y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa warp[-1].z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa warp[-1].dim set from entity @s Dimension
function tpa:warp/add/default_name