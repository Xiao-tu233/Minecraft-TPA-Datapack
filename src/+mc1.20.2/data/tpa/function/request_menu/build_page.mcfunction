# Parent function: tpa:request_menu/open

execute if data storage tpa:tpa temp.request_menu.remaining[0] run function tpa:request_menu/append_slot

scoreboard players remove #request_menu.slots_left tpa.variables 1

execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/build_page
