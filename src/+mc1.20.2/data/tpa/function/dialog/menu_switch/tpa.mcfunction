# Parent function: tpa:dialog
data modify storage tpa:tpa temp.dialog_menu_switch.action.command set value "/trigger tpa.dialog set 2"
data modify storage tpa:tpa temp.dialog_menu_switch.label set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button
data modify storage tpa:tpa temp.dialog_menu_switch.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button_hoverevent