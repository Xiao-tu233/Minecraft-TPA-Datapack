# Parent function: tpa:warp/menu/prepare_output/load_edit_buttons
data modify storage tpa:tpa temp.components.moveup.enabled.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.moveup.enabled.label set from storage tpa:tpa loaded_lang.warp_button_moveup
data modify storage tpa:tpa temp.components.moveup.enabled.tooltip set from storage tpa:tpa loaded_lang.warp_button_moveup_hoverevent
data remove storage tpa:tpa temp.components.moveup.disabled