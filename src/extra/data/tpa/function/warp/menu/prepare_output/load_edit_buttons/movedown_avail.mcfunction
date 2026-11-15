# Parent function: tpa:warp/menu/prepare_output/load_edit_buttons
data modify storage tpa:tpa temp.components.movedown.enabled.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.movedown.enabled.label set from storage tpa:tpa loaded_lang.warp_button_movedown
data modify storage tpa:tpa temp.components.movedown.enabled.tooltip set from storage tpa:tpa loaded_lang.warp_button_movedown_hoverevent
data remove storage tpa:tpa temp.components.movedown.disabled