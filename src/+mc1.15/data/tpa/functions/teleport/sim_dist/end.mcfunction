# Parent function: tpa:teleport/next_node
# This function should be run 1 tick after tpa:cal_sim_dist

tp @s @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin]
kill @e[tag=tpa.teleport_anchor_origin]
scoreboard players set #is_teleport_executing tpa.variables 0
scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players remove #sim_dist tpa.config 2
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players remove #sim_dist tpa.variables 1