# Parent function: tpa:request_menu/open

scoreboard players set #request_menu.slot_filled tpa.variables 0
execute if data storage tpa:tpa temp.request_menu.remaining[0] run function tpa:request_menu/append_slot

scoreboard players remove #request_menu.slot tpa.variables 1
scoreboard players remove #request_menu.slots_left tpa.variables 1

execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/build_page
