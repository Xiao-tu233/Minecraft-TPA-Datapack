# Parent function: tpa:warp/menu, tpa:warp/show_each(loop)

# Check if the warp is available
execute store result score #warp_disabled tpa.variables run data get storage tpa:tpa temp.warp[0].disabled

data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.warp[0].dim
function tpa:dimension/get

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dim_color set from storage tpa:tpa temp.dimension.color
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
function tpa:warp/show_each_macro with storage tpa:tpa temp.args

# i++
data remove storage tpa:tpa temp.warp[0]
scoreboard players add #i tpa.variables 1

# Loop
execute if data storage tpa:tpa temp.warp[0] run function tpa:warp/show_each
