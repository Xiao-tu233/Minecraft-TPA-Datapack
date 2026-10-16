# Parent function: tpa:warp/menu/prepare_output/loop
data remove storage tpa:tpa temp.components
data modify storage tpa:tpa temp.components.tooltip.x set string storage tpa:tpa temp.warp_result[0].x
data modify storage tpa:tpa temp.components.tooltip.y set string storage tpa:tpa temp.warp_result[0].y
data modify storage tpa:tpa temp.components.tooltip.z set string storage tpa:tpa temp.warp_result[0].z
data modify storage tpa:tpa temp.components.tooltip.brackets set value ["(", ")"]
data modify storage tpa:tpa temp.components.tooltip.space set value " "
data modify storage tpa:tpa temp.components.tooltip.dimension set from storage tpa:tpa temp.dimension.name
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location set from storage tpa:tpa loaded_lang.warp_hoverevent_location
data modify storage tpa:tpa temp.components.tooltip.hoverevent_location_format set from storage tpa:tpa loaded_lang.warp_hoverevent_location_format
data modify storage tpa:tpa temp.components.tooltip.desc set from storage tpa:tpa temp.warp_result[0].desc
data modify storage tpa:tpa temp.components.button_tp.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_tp.label set from storage tpa:tpa loaded_lang.warp_button_tp
data modify storage tpa:tpa temp.components.button_tp.tooltip set from storage tpa:tpa loaded_lang.warp_button_tp_hoverevent

data modify storage tpa:tpa temp.components.disable.brackets set from storage tpa:tpa warp[0].option_buttons.brackets
data modify storage tpa:tpa temp.components.disable.label set from storage tpa:tpa warp[0].option_buttons.disable
data modify storage tpa:tpa temp.components.disable.tooltip set from storage tpa:tpa loaded_lang.warp_button_disable_hoverevent

data modify storage tpa:tpa temp.output.slots[-1].enabled set from storage tpa:tpa temp.components