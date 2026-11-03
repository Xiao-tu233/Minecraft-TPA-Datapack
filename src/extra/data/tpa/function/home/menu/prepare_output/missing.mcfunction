# Parent function: tpa:home/menu/prepare_output/loop
# This slot is within max_id but has no saved Home. It can only be set.
data remove storage tpa:tpa temp.components
data modify storage tpa:tpa temp.components.color set value "white"
data modify storage tpa:tpa temp.components.label set value []
data modify storage tpa:tpa temp.components.label append from storage tpa:tpa loaded_lang.home_display
data modify storage tpa:tpa temp.components.label append from storage tpa:tpa temp.output.home_id
data modify storage tpa:tpa temp.components.tooltip.missing set from storage tpa:tpa loaded_lang.home_missing_hoverevent
data modify storage tpa:tpa temp.components.button_set.brackets set value ["[", "]"]
data modify storage tpa:tpa temp.components.button_set.label set from storage tpa:tpa loaded_lang.home_button_create
data modify storage tpa:tpa temp.components.button_set.tooltip set from storage tpa:tpa loaded_lang.home_button_create_hoverevent
data modify storage tpa:tpa temp.output.slots[-1] set from storage tpa:tpa temp.components
