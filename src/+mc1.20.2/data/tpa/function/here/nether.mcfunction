data modify storage tpa:tpa temp.args.if_trans set value " -> "
data modify storage tpa:tpa temp.args.space_trans set value " "

execute store result storage tpa:tpa temp.args.x_trans int 1 run data get entity @s Pos[0] 8
execute store result storage tpa:tpa temp.args.y_trans int 1 run data get entity @s Pos[1] 1
execute store result storage tpa:tpa temp.args.z_trans int 1 run data get entity @s Pos[2] 8

execute if score #uses_string_dimension tpa.config matches 0 run data modify storage tpa:tpa temp.args.id set value 0
execute if score #uses_string_dimension tpa.config matches 1 run data modify storage tpa:tpa temp.args.id set value "minecraft:overworld"
function tpa:dimension/get
data modify storage tpa:tpa temp.args.trans_color set from storage tpa:tpa temp.dimension.color

execute if score #uses_string_dimension tpa.config matches 0 run data modify storage tpa:tpa temp.args.id set value -1
execute if score #uses_string_dimension tpa.config matches 1 run data modify storage tpa:tpa temp.args.id set value "minecraft:the_nether"
function tpa:dimension/get