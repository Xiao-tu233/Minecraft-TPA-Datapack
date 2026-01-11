# Parent function: tpa:teleport/next_node
# This function should be run 1 tick after tpa:cal_sim_dist

tp @s @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_origin]
kill @e[tag=tpa.teleport_anchor_origin]
tag @a remove tpa.teleport
scoreboard players set #is_teleport_executing tpa.variables 0
scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players remove #sim_dist tpa.config 2
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players remove #sim_dist tpa.variables 1

# Debugs and outputs
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
title @p[tag=tpa.teleport] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_cal_sim_dist_end_leftpart"}, {"score":{"objective":"tpa.config","name":"#sim_dist"}, "color": "green"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_cal_sim_dist_end_rightpart"}]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSimulate distance has been finally calculated: ", {"score":{"objective":"tpa.config","name":"#sim_dist"}, "color": "green"}]