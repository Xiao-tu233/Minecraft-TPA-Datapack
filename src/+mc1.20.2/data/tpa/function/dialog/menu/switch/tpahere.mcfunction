# Parent function: tpa:dialog
data modify storage tpa:tpa temp.dialog.actions[-1].action.command set value "/trigger tpa.dialog set 1"
data modify storage tpa:tpa temp.dialog.actions[-1].label set from storage tpa:tpa loaded_lang.tpa_menu_tpamenu_button
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_tpamenu_button_hoverevent