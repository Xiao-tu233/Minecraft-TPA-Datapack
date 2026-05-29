# Parent Function: tpa:tpa, tpa:back, tpa:tpaccept, tpa:list_online, tpa:tp_pos/act, tpa:home

# Check if function is called by a player or the server: #target_id is None
execute unless score #target_id tpa.variables = #target_id tpa.variables run scoreboard players operation #target_id tpa.variables = @s tpa.player_id

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #target_id tpa.variables

function tpa:back/set_macro with storage tpa:tpa temp.args
scoreboard players reset #target_id tpa.variables