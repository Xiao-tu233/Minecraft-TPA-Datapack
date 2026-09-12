# Parent function: tpa:output/warp/menu_macro

data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.append_indexes.enabled.tooltip.x
data modify storage tpa:tpa temp.output.format_parser append value " "
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.append_indexes.enabled.tooltip.y
data modify storage tpa:tpa temp.output.format_parser append value " "
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.append_indexes.enabled.tooltip.z