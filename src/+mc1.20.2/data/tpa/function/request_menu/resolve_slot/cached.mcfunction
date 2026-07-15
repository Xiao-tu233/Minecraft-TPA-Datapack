# Parent function: tpa:request_menu/resolve_slot

execute store result score #request_menu.page tpa.variables run data get storage tpa:tpa temp.matched_request_menu.page
scoreboard players operation #request_menu.slot_index tpa.variables = #request_menu.input tpa.variables
scoreboard players operation #request_menu.slot_index tpa.variables *= #-1 tpa.variables
scoreboard players remove #request_menu.slot_index tpa.variables 3

scoreboard players operation #request_menu.offset tpa.variables = #request_menu.page tpa.variables
scoreboard players remove #request_menu.offset tpa.variables 1
scoreboard players operation #request_menu.offset tpa.variables *= #20 tpa.variables
scoreboard players operation #request_menu.offset tpa.variables += #request_menu.slot_index tpa.variables

data modify storage tpa:tpa temp.request_menu.remaining set from storage tpa:tpa temp.matched_request_menu.players
function tpa:request_menu/drop_offset
execute store result score #recver tpa.variables if data storage tpa:tpa temp.request_menu.remaining[0].uid run data get storage tpa:tpa temp.request_menu.remaining[0].uid
