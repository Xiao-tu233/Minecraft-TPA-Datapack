# Parent function: tpa:warp/menu/prepare_output/loop
data modify storage tpa:tpa temp.output.slots[-1].color set value "gray"

data remove storage tpa:tpa temp.components

data modify storage tpa:tpa temp.components.tooltip set from storage tpa:tpa loaded_lang.warp_desc_disabled

data modify storage tpa:tpa temp.components.button_tp.brackets set value ["§8[", "§8]"]
data modify storage tpa:tpa temp.components.button_tp.label set from storage tpa:tpa loaded_lang.warp_button_tp
data modify storage tpa:tpa temp.components.button_tp.tooltip set from storage tpa:tpa loaded_lang.warp_desc_disabled

data modify storage tpa:tpa temp.components.enable.brackets set from storage tpa:tpa warp[0].option_buttons.brackets
data modify storage tpa:tpa temp.components.enable.label set from storage tpa:tpa warp[0].option_buttons.enable
data modify storage tpa:tpa temp.components.enable.tooltip set from storage tpa:tpa loaded_lang.warp_button_enable_hoverevent

data modify storage tpa:tpa temp.output.slots[-1].disabled set from storage tpa:tpa temp.components