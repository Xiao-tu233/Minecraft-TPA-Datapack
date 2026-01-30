# Parent function: tpa:dialog

# max_players = min(20, current_avail_count)
scoreboard players set #max_players tpa.variables 20
execute if score #current_avail_count tpa.variables < #max_players tpa.variables run scoreboard players operation #max_players tpa.variables = #current_avail_count tpa.variables

scoreboard players set #player_got tpa.variables 0
scoreboard players set #i tpa.variables 2
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #player_got tpa.variables
function tpa:dialog/get_available_players_loop with storage tpa:tpa temp.args