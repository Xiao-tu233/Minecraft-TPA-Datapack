# Parent function: tpa:request_menu/display/dialog/tpa

data modify storage tpa:tpa temp.request_menu.dialog_remaining set from storage tpa:tpa temp.request_menu.page_players
data modify storage tpa:tpa temp.request_menu.dialog_slot.trigger set value "tpa"
scoreboard players set #request_menu.slot_value tpa.variables -3
scoreboard players set #request_menu.slots_left tpa.variables 20
function tpa:request_menu/display/dialog/available_player_exists/append_slot
