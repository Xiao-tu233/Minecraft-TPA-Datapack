# Parent function: tpa:warp/menu/prepare_output
data remove storage tpa:tpa temp.components

data modify storage tpa:tpa temp.components.setpos.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.setpos.label set from storage tpa:tpa loaded_lang.warp_button_setpos
data modify storage tpa:tpa temp.components.setpos.tooltip set from storage tpa:tpa loaded_lang.warp_button_setpos_hoverevent
data modify storage tpa:tpa temp.components.setname.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.setname.label set from storage tpa:tpa loaded_lang.warp_button_setname
data modify storage tpa:tpa temp.components.setname.tooltip set from storage tpa:tpa loaded_lang.warp_button_setname_hoverevent
data modify storage tpa:tpa temp.components.setdesc.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.setdesc.label set from storage tpa:tpa loaded_lang.warp_button_setdesc
data modify storage tpa:tpa temp.components.setdesc.tooltip set from storage tpa:tpa loaded_lang.warp_button_setdesc_hoverevent
data modify storage tpa:tpa temp.components.rm.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.rm.label set from storage tpa:tpa loaded_lang.warp_button_rm
data modify storage tpa:tpa temp.components.rm.tooltip set from storage tpa:tpa loaded_lang.warp_button_rm_hoverevent
data modify storage tpa:tpa temp.components.enable.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.enable.label set from storage tpa:tpa loaded_lang.warp_button_enable
data modify storage tpa:tpa temp.components.enable.tooltip set from storage tpa:tpa loaded_lang.warp_button_enable_hoverevent
data modify storage tpa:tpa temp.components.disable.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.disable.label set from storage tpa:tpa loaded_lang.warp_button_disable
data modify storage tpa:tpa temp.components.disable.tooltip set from storage tpa:tpa loaded_lang.warp_button_disable_hoverevent
data modify storage tpa:tpa temp.components.moveup.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.moveup.label set from storage tpa:tpa loaded_lang.warp_button_moveup
data modify storage tpa:tpa temp.components.moveup.tooltip set from storage tpa:tpa loaded_lang.warp_button_moveup_hoverevent
data modify storage tpa:tpa temp.components.movedown.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa temp.components.movedown.label set from storage tpa:tpa loaded_lang.warp_button_movedown
data modify storage tpa:tpa temp.components.movedown.tooltip set from storage tpa:tpa loaded_lang.warp_button_movedown_hoverevent

data modify storage tpa:tpa warp[0].option_buttons.brackets set value ["§6[", "§6]"]
data modify storage tpa:tpa warp[0].option_buttons.enable set from storage tpa:tpa loaded_lang.warp_button_enable
data modify storage tpa:tpa warp[0].option_buttons.disable set from storage tpa:tpa loaded_lang.warp_button_disable

data modify storage tpa:tpa temp.output.slots[-1].buttons set from storage tpa:tpa temp.components