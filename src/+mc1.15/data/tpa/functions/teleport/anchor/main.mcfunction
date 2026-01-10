# Parent function: tpa:teleport/main

scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players remove #sim_dist tpa.variables 1
scoreboard players operation #negative_sim_dist tpa.variables = #sim_dist tpa.variables
scoreboard players operation #negative_sim_dist tpa.variables *= #-1 tpa.variables

function tpa:teleport/anchor/calc_node
scoreboard players operation #max_node_count_x tpa.variables = #node_count_x tpa.variables
scoreboard players operation #max_node_count_z tpa.variables = #node_count_z tpa.variables
scoreboard players operation #max_d tpa.variables = #dx tpa.variables
scoreboard players operation #max_d tpa.variables += #dz tpa.variables

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rTeleporting ", {"selector":"@p[tag=tpa.teleport]"}, " with ", {"score": {"name": "#max_node_count_x", "objective": "tpa.variables"}}, " via anchors on x, and ", {"score": {"name": "#max_node_count_z", "objective": "tpa.variables"}}, " via anchors on z, Manhattan distance(x+z)", {"score": {"name": "#max_d", "objective": "tpa.variables"}}]

scoreboard players set #teleport_state tpa.variables 1