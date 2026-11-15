# Parent function: tpa:warp/menu/prepare_output/load_edit_buttons
data remove storage tpa:tpa temp.components.moveup.enabled
data modify storage tpa:tpa temp.components.moveup.disabled.brackets set value ["§8[", "§8]"]
data modify storage tpa:tpa temp.components.moveup.disabled.label set from storage tpa:tpa loaded_lang.warp_button_moveup
data modify storage tpa:tpa temp.components.moveup.disabled.tooltip set from storage tpa:tpa loaded_lang.warp_button_moveup_notavail_hoverevent