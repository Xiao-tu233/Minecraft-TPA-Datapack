# Parent function: tpa:request_menu/display/dialog/available_player_exists/tpa, tpa:request_menu/display/dialog/available_player_exists/tpahere

# Since dialog is added in 1.21.6 > 1.20.2, so macro functions are imported here to avoid spamming
data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.value int 1 run scoreboard players get #request_menu.slot_value tpa.variables
data modify storage tpa:tpa temp.args.direction set from storage tpa:tpa temp.request_menu.dialog_slot.trigger
function tpa:request_menu/display/dialog/available_player_exists/slot with storage tpa:tpa temp.args

data remove storage tpa:tpa temp.request_menu.dialog_remaining[0]
scoreboard players remove #request_menu.slot_value tpa.variables 1
scoreboard players remove #request_menu.slots_left tpa.variables 1
execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/display/dialog/available_player_exists/append_slot
