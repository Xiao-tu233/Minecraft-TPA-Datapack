# Parent function: tpa:teleport/next_node (in case #teleport_state == 4)

# Set origin anchor
execute if score #teleport_origin_anchor_summoned tpa.variables matches 0 as @p[tag=tpa.teleport] at @s run function tpa:teleport/sim_dist/origin

execute as @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] at @s run tp ~16 ~ ~
execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run scoreboard players add #sim_dist tpa.config 1
execute unless entity @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] run function tpa:teleport/sim_dist/kill_anchor

# Debugs and outputs
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
title @p[tag=tpa.teleport] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_cal_sim_dist_actionbar"}, ": ", {"score":{"objective":"tpa.config","name":"#sim_dist"}, "color": "green"}]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSimulate distance is now tested and set to ", {"score":{"objective":"tpa.config","name":"#sim_dist"}, "color": "green"}]