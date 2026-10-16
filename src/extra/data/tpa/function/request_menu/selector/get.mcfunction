# Parent function: tpa:request_menu/resolve_slot, tpa:request_menu/turn_page

data modify storage tpa:tpa temp.matched_request_menu set value {}
data modify storage tpa:tpa request_menu.menus append value {sentinel: 1b}
scoreboard players set #request_menu.removing tpa.variables 0
execute unless data storage tpa:tpa request_menu.menus[0].sentinel run function tpa:request_menu/selector/loop
data remove storage tpa:tpa request_menu.menus[0]
