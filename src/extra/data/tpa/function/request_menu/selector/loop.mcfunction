# Parent function: tpa:request_menu/selector/get, tpa:request_menu/selector/remove

execute store result score #request_menu.current_uid tpa.variables run data get storage tpa:tpa request_menu.menus[0].uid
execute store result score #request_menu.current_direction tpa.variables run data get storage tpa:tpa request_menu.menus[0].direction
scoreboard players set #request_menu.entry_matches tpa.variables 0
execute if score #request_menu.current_uid tpa.variables = #uid tpa.variables if score #request_menu.current_direction tpa.variables = #request_menu.direction tpa.variables run scoreboard players set #request_menu.entry_matches tpa.variables 1

execute if score #request_menu.entry_matches tpa.variables matches 1 run data modify storage tpa:tpa temp.matched_request_menu set from storage tpa:tpa request_menu.menus[0]
execute if score #request_menu.removing tpa.variables matches 0 run data modify storage tpa:tpa request_menu.menus append from storage tpa:tpa request_menu.menus[0]
execute if score #request_menu.removing tpa.variables matches 1 unless score #request_menu.entry_matches tpa.variables matches 1 run data modify storage tpa:tpa request_menu.menus append from storage tpa:tpa request_menu.menus[0]
data remove storage tpa:tpa request_menu.menus[0]

execute unless data storage tpa:tpa request_menu.menus[0].sentinel run function tpa:request_menu/selector/loop
