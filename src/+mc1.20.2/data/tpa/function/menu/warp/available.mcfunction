# Parent function: tpa:menu/warp/enabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.tpa_menu_warp_button_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].action set value {type: "minecraft:run_command", command: "/trigger tpa.warp set -1"}
