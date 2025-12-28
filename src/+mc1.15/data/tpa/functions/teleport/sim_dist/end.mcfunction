# Parent function: tpa:teleport/next_node
# This function should be run 1 tick after tpa:cal_sim_dist

kill @e[tag=tpa.teleport_anchor]
tp @s @e[tag=tpa.teleport_anchor_]
kill @e[tag=tpa.teleport_anchor_]
scoreboard players set #is_teleport_executing tpa.variables 0