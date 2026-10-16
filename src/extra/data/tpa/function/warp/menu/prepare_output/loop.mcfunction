# Parent function: tpa:warp/menu/prepare_output

data modify storage tpa:tpa temp.output.slots append value {}

# Check if the warp is available
execute store result score #warp_disabled tpa.variables run data get storage tpa:tpa temp.warp_result[0].disabled

data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.warp_result[0].dim
function tpa:dimension/get
#! For 1.20.1-, temp.output.color is the number id of the dimension or -2 for gray(warp disabled)
data modify storage tpa:tpa temp.output.slots[-1].color set from storage tpa:tpa temp.dimension.color
data modify storage tpa:tpa temp.output.slots[-1].label set from storage tpa:tpa temp.warp_result[0].name

# Load buttons
data remove storage tpa:tpa warp[0].option_buttons
execute if score #warp.editting tpa.variables matches 1 run function tpa:warp/menu/prepare_output/load_edit_buttons

execute if score #warp_disabled tpa.variables matches 0 run function tpa:warp/menu/prepare_output/current_enabled
execute if score #warp_disabled tpa.variables matches 1 run function tpa:warp/menu/prepare_output/current_disabled

# Loop
data modify storage tpa:tpa temp.warp_result append from storage tpa:tpa temp.warp_result[0]
data remove storage tpa:tpa temp.warp_result[0]
execute unless data storage tpa:tpa temp.warp_result[0].sentinel run function tpa:warp/menu/prepare_output/loop