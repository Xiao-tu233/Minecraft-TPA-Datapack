# Parent function: tpa:home/menu/prepare_output/loop

data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.home_result[0].dimension
function tpa:dimension/get

data remove storage tpa:tpa temp.components
#! For 1.20.1-, temp.output.color is the number id of the dimension
data modify storage tpa:tpa temp.components.color set from storage tpa:tpa temp.dimension.color
data modify storage tpa:tpa temp.components.label set value []
data modify storage tpa:tpa temp.components.label append from storage tpa:tpa loaded_lang.home_display
data modify storage tpa:tpa temp.components.label append from storage tpa:tpa temp.output.home_id
data modify storage tpa:tpa temp.components.tooltip.space set value " "
data modify storage tpa:tpa temp.components.tooltip.x set string storage tpa:tpa temp.home_result[0].x
data modify storage tpa:tpa temp.components.tooltip.y set string storage tpa:tpa temp.home_result[0].y
data modify storage tpa:tpa temp.components.tooltip.z set string storage tpa:tpa temp.home_result[0].z
data modify storage tpa:tpa temp.components.tooltip.dimension set from storage tpa:tpa temp.dimension.name
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location set from storage tpa:tpa loaded_lang.home_hoverevent_location
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location_format set from storage tpa:tpa loaded_lang.home_hoverevent_location_format

data modify storage tpa:tpa temp.components.button_tp.space set value " "
data modify storage tpa:tpa temp.components.button_tp.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_tp.label set from storage tpa:tpa loaded_lang.home_button_tp
data modify storage tpa:tpa temp.components.button_tp.tooltip set from storage tpa:tpa loaded_lang.home_button_tp_hoverevent
data modify storage tpa:tpa temp.components.button_rm.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_rm.label set from storage tpa:tpa loaded_lang.home_button_rm
data modify storage tpa:tpa temp.components.button_rm.tooltip set from storage tpa:tpa loaded_lang.home_button_rm_hoverevent
data modify storage tpa:tpa temp.components.button_set.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_set.label set from storage tpa:tpa loaded_lang.home_button_set
data modify storage tpa:tpa temp.components.button_set.tooltip set from storage tpa:tpa loaded_lang.home_button_set_hoverevent

data modify storage tpa:tpa temp.output.slots[-1] set from storage tpa:tpa temp.components

data remove storage tpa:tpa temp.home_result[0]