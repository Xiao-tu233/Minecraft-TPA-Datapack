# Parent function: tpa:request_menu/prepare, tpa:request_menu/resolve_slot/cached
data remove storage tpa:tpa temp.request_menu.remaining[0]
scoreboard players remove #request_menu.offset tpa.variables 1

execute if score #request_menu.offset tpa.variables matches 1.. if data storage tpa:tpa temp.request_menu.remaining[0] run function tpa:request_menu/drop_offset
