# Parent function: tpa:request_menu/display/chatbar

execute if data storage tpa:tpa temp.request_menu.chatbar_remaining[0] run function tpa:request_menu/display/chatbar/append_slot

scoreboard players remove #request_menu.slots_left tpa.variables 1

execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/display/chatbar/build_page
