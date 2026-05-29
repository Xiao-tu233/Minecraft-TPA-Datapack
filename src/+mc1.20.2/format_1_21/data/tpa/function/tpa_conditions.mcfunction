# Parent function: tpa:tpa
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run return 1
execute if score #time_out tpa.config matches 0 run return 2
execute if score #tp_here tpa.variables = @s tpa.player_id run return 3
execute if score #tp_to tpa.variables = @s tpa.player_id run return 3
execute if score #tp_here tpa.variables = @s tpa.tp_to if score #tp_here tpa.variables matches 2.. run return 4
execute if score #tp_to tpa.variables = @s tpa.tp_to if score #tp_to tpa.variables matches 2.. run return 4
execute if score @s tpa.tp_to matches 2.. run return 5
return 0

