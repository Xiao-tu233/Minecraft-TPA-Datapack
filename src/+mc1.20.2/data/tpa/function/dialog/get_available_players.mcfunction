# Parent function: tpa:dialog

scoreboard players set #i tpa.variables 0
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #i tpa.variables
function tpa:dialog/get_available_players_loop with storage tpa:tpa temp.args
