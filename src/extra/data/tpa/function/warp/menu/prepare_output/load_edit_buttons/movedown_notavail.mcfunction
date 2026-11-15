# Parent function: tpa:warp/menu/prepare_output/load_edit_buttons
data remove storage tpa:tpa temp.components.movedown.enabled
data modify storage tpa:tpa temp.components.movedown.disabled.brackets set value ["§8[", "§8]"]
data modify storage tpa:tpa temp.components.movedown.disabled.label set from storage tpa:tpa loaded_lang.warp_button_movedown
data modify storage tpa:tpa temp.components.movedown.disabled.tooltip set from storage tpa:tpa loaded_lang.warp_button_movedown_notavail_hoverevent