# Parent function: tpa:search_id/enter_name
# $return run scoreboard players get @p[name="$(input_name)"] tpa.player_id
scoreboard players set #player_id tpa.variables -1
$scoreboard players operation #player_id tpa.variables = @p[name="$(input_name)"] tpa.player_id