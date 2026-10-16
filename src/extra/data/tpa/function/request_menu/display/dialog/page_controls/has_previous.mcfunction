# Parent function: tpa:request_menu/display/dialog/page_controls

data modify storage tpa:tpa temp.dialog.actions[-1].label.color set value "white"
data modify storage tpa:tpa temp.dialog.actions[-1].action.type set value "minecraft:run_command"
execute if score #request_menu.direction tpa.variables matches 0 run data modify storage tpa:tpa temp.dialog.actions[-1].action.command set value "/trigger tpa.tpa set -2"
execute if score #request_menu.direction tpa.variables matches 1 run data modify storage tpa:tpa temp.dialog.actions[-1].action.command set value "/trigger tpa.tpahere set -2"
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set from storage tpa:tpa loaded_lang.reqer_cancel_selector_button_previous_page_hoverevent