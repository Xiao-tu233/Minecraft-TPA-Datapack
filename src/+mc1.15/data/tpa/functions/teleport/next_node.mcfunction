# Parent function: EXACT "tpa:tick"

# #teleport_state:
# 0 - teleport player to the nearest anchor and summon a new anchor
# 1 - same as 0 but summon anchor to the exact destin
# 2 - teleport player to the final anchor and then quit teleport process
# 3 - run binary main to approach to the destin anchor
# 4 - approach sim dist, tp ~16 ~ ~
# 5 - kill the final anchor of simdist calcing and teleport player back and kill again

execute if score #teleport_state tpa.variables matches 4 run function tpa:teleport/sim_dist/approach
execute if score #teleport_state tpa.variables matches 5 as @p[tag=tpa.teleport] run function tpa:teleport/sim_dist/end

execute if score #is_cal_sim_dist_executing tpa.variables matches 1 positioned 0 1 0 as @p run function tpa:teleport/cal_sim_dist_
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 if score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] run function tpa:teleport/main_0
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 unless score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] unless entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}] run function tpa:teleport/finding_archor
execute unless score #is_cal_sim_dist_executing tpa.variables matches 1 unless score #is_dimension_loaded tpa.variables matches 1 as @p[tag=teleport] if entity @e[nbt={Item:{tag:{isTeleportAnchor: 1b}}}] run function tpa:teleport/main_1
execute unless score #is_dimension_loaded tpa.variables matches 1 if score #if_accuate_tp tpa.variables matches 2 run function tpa:teleport/main_complete