# Parent function: tpa:request_menu/prepare, tpa:request_menu/prepare_page(loop for 20 times)

data modify storage tpa:tpa temp.request_menu.page_players append from storage tpa:tpa temp.request_menu.remaining[0]
execute unless data storage tpa:tpa temp.request_menu.remaining[0] run data modify storage tpa:tpa temp.request_menu.page_players append value {uid: 0}

data remove storage tpa:tpa temp.request_menu.remaining[0]
scoreboard players remove #request_menu.slots_left tpa.variables 1
execute if score #request_menu.slots_left tpa.variables matches 1.. run function tpa:request_menu/prepare_page