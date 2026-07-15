# Parent function: tpa:request_menu/selector/set

data modify storage tpa:tpa request_menu.menus append value {sentinel: 1b}
scoreboard players set #request_menu.removing tpa.variables 1
execute unless data storage tpa:tpa request_menu.menus[0].sentinel run function tpa:request_menu/selector/loop
data remove storage tpa:tpa request_menu.menus[0]
