
execute if score #is_cal_sim_dist_executing tpa.variables matches 1 positioned 0 1 0 as @p run function tpa:teleport/cal_sim_dist_
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 if score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] run function tpa:teleport/main_0
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 unless score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] unless entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}] run function tpa:teleport/finding_archor
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 unless score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] if entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}] run function tpa:teleport/main_1
execute unless score #is_dimension_loaded tpa.variables matches 1 if score #if_accuate_tp tpa.variables matches 2 run function tpa:teleport/main_complete