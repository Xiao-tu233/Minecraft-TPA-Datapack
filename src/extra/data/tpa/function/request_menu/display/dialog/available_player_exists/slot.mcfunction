# Parent function: tpa:request_menu/display/dialog/available_player_exists/append_slot
# @macro: {trigger: string, value: int}

data modify storage tpa:tpa temp.request_menu.dialog_action set value {width: 100, label: ""}
$execute if data storage tpa:tpa temp.request_menu.dialog_remaining[0].name run data modify storage tpa:tpa temp.request_menu.dialog_action set value {width: 100, action: {type: "minecraft:run_command", command: "/trigger tpa.$(trigger) set $(value)"}, tooltip: []}
execute if data storage tpa:tpa temp.request_menu.dialog_remaining[0].name run data modify storage tpa:tpa temp.request_menu.dialog_action.label set from storage tpa:tpa temp.request_menu.dialog_remaining[0].name
execute if data storage tpa:tpa temp.request_menu.dialog_remaining[0].name run data modify storage tpa:tpa temp.request_menu.dialog_action.tooltip append from storage tpa:tpa loaded_lang.tpa_menu_hoverevent[0]
execute if data storage tpa:tpa temp.request_menu.dialog_remaining[0].name run data modify storage tpa:tpa temp.request_menu.dialog_action.tooltip append from storage tpa:tpa temp.request_menu.dialog_remaining[0].name
execute if data storage tpa:tpa temp.request_menu.dialog_remaining[0].name run data modify storage tpa:tpa temp.request_menu.dialog_action.tooltip append from storage tpa:tpa loaded_lang.tpa_menu_hoverevent[1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.request_menu.dialog_action
