# Parent function: tpa:request_menu/display/dialog/available_player_exists/tpa, tpa:request_menu/display/dialog/available_player_exists/tpahere

execute store result storage tpa:tpa temp.request_menu.dialog_slot.value int 1 run scoreboard players get #request_menu.slot_value tpa.variables
function tpa:request_menu/display/dialog/available_player_exists/slot with storage tpa:tpa temp.request_menu.dialog_slot

data remove storage tpa:tpa temp.request_menu.dialog_remaining[0]
scoreboard players remove #request_menu.slot_value tpa.variables 1
scoreboard players remove #request_menu.slots_left tpa.variables 1
execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/display/dialog/available_player_exists/append_slot
