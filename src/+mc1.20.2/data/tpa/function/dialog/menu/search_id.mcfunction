# Parent function: tpa:dialog
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.search_id"}
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button_hoverevent