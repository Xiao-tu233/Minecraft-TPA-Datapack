# Parent function: tpa:request_menu/open, tpa:request_menu/resolve_slot

scoreboard players set #request_menu.dropped tpa.variables 0
execute if score #request_menu.offset tpa.variables matches 1.. if data storage tpa:tpa temp.request_menu.remaining[0] run scoreboard players set #request_menu.dropped tpa.variables 1
execute if score #request_menu.dropped tpa.variables matches 1 run data remove storage tpa:tpa temp.request_menu.remaining[0]
execute if score #request_menu.dropped tpa.variables matches 1 run scoreboard players remove #request_menu.offset tpa.variables 1
execute if score #request_menu.offset tpa.variables matches 1.. if data storage tpa:tpa temp.request_menu.remaining[0] run function tpa:request_menu/drop_offset
