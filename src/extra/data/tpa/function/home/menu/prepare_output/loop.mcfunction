# Parent function: tpa:home/menu/prepare_output

data modify storage tpa:tpa temp.output.slots append value {}

data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.home_result[0].dimension
function tpa:dimension/get
#! For 1.20.1-, temp.output.color is the number id of the dimension 
data modify storage tpa:tpa temp.output.slots[-1].color set from storage tpa:tpa temp.dimension.color
data modify storage tpa:tpa temp.output.slots[-1].label set from storage tpa:tpa temp.home_result[0].name

data remove storage tpa:tpa temp.components
data modify storage tpa:tpa temp.components.tooltip.x set string storage tpa:tpa temp.home_result[0].x
data modify storage tpa:tpa temp.components.tooltip.y set string storage tpa:tpa temp.home_result[0].y
data modify storage tpa:tpa temp.components.tooltip.z set string storage tpa:tpa temp.home_result[0].z
data modify storage tpa:tpa temp.components.tooltip.dimension set from storage tpa:tpa temp.dimension.name
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location set from storage tpa:tpa loaded_lang.home_hoverevent_location
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location_format set from storage tpa:tpa loaded_lang.home_hoverevent_location_format
data modify storage tpa:tpa temp.components.tooltip.desc set from storage tpa:tpa temp.home_result[0].desc
data modify storage tpa:tpa temp.components.button_tp.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_tp.label set from storage tpa:tpa loaded_lang.home_button_tp
data modify storage tpa:tpa temp.components.button_tp.tooltip set from storage tpa:tpa loaded_lang.home_button_tp_hoverevent

data modify storage tpa:tpa temp.output.slots[-1].enabled set from storage tpa:tpa temp.components
# Loop
data modify storage tpa:tpa temp.home_result append from storage tpa:tpa temp.home_result[0]
data remove storage tpa:tpa temp.home_result[0]
execute unless data storage tpa:tpa temp.home_result[0].sentinel run function tpa:home/menu/prepare_output/loop
