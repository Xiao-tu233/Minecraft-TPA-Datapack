# Parent function: tpa:warp/menu/prepare_output/loop
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.x set string storage tpa:tpa temp.warp_result[0].x
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.y set string storage tpa:tpa temp.warp_result[0].y
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.z set string storage tpa:tpa temp.warp_result[0].z
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.brackets set value ["(", ")"]
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.space set value " "
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.dimension set from storage tpa:tpa temp.dimension.name
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.hoverevent_location set from storage tpa:tpa loaded_lang.warp_hoverevent_location
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.hoverevent_location_format set from storage tpa:tpa loaded_lang.warp_hoverevent_location_format
data modify storage tpa:tpa temp.output.slots[-1].enabled.tooltip.desc set from storage tpa:tpa temp.warp_result[0].desc
