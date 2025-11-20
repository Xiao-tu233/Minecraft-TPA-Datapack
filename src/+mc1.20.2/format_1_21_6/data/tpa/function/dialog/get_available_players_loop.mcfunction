# Parent function: tpa:dialog/get_available_players
# @macro: {id: int, index: int}

data remove storage tpa:tpa temp.name
$execute as @p[scores={tpa.player_id=$(id)}] run function tpa:get_name
$data modify storage tpa:tpa temp.args.name_$(index) set from storage tpa:tpa temp.name
$data modify storage tpa:tpa temp.args.id_$(index) set value $(id)
$execute as @p[scores={tpa.player_id=$(id)}] run scoreboard players add #player_got tpa.variables 1

# Loop
scoreboard players add #i tpa.variables 1
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #i tpa.variables
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #player_got tpa.variables

# i >= #global_current: break
execute if score #compact_ids tpa.config matches 0 if score #i tpa.variables >= #global_current tpa.uid run return 0
execute if score #compact_ids tpa.config matches 1 if score #i tpa.variables >= #global_current tpa.player_id run return 0

function tpa:dialog/get_available_players_loop with storage tpa:tpa temp.args
