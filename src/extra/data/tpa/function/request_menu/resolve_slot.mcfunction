# Parent function: tpa:tpa, tpa:tpahere
# Args: #request_menu.direction, #request_menu.input
# Sets #recver tpa.variables when a cached slot is found

scoreboard players reset #recver tpa.variables
scoreboard players set #uid tpa.variables -1
execute if score @s tpa.uid = @s tpa.uid run scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:request_menu/selector/get
scoreboard players set #request_menu.has_cache tpa.variables 0
execute if data storage tpa:tpa temp.matched_request_menu.players run scoreboard players set #request_menu.has_cache tpa.variables 1

execute if score #request_menu.has_cache tpa.variables matches 1 run function tpa:request_menu/resolve_slot/cached
