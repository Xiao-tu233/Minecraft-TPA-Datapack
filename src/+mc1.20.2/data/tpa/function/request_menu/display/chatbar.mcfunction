# Parent function: tpa:request_menu/display

data modify storage tpa:tpa temp.request_menu.chatbar_remaining set from storage tpa:tpa temp.request_menu.page_players
data modify storage tpa:tpa temp.request_menu.display_list set value []
scoreboard players set #request_menu.slots_left tpa.variables 20
function tpa:request_menu/display/chatbar/build_page

execute if score #request_menu.direction tpa.variables matches 0 run function tpa:request_menu/display/chatbar/tpa
execute if score #request_menu.direction tpa.variables matches 1 run function tpa:request_menu/display/chatbar/tpahere
