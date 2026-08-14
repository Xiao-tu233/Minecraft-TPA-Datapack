# Parent function: tpa:dialog/get_available_players
# @macro: {index: int}

$data modify storage tpa:tpa temp.args.name_$(index) set from storage tpa:tpa temp.request_menu.page_players[$(index)].name
$data modify storage tpa:tpa temp.args.id_$(index) set from storage tpa:tpa temp.request_menu.page_players[$(index)].uid

execute if score #i tpa.variables matches 19 run return 0
scoreboard players add #i tpa.variables 1
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
function tpa:dialog/get_available_players_loop with storage tpa:tpa temp.args
