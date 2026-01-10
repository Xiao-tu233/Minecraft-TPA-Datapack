# Parent function: EXACT "tpa:tick"

# #teleport_state:
# 0 - teleport player to the nearest anchor and summon a new anchor
# 1 - same as 0 but without summon anchor(destin anchor reachable)  
# 2 - teleport player to the final anchor and then quit teleport process
# 3 - run binary main to approach to the destin anchor
# 4 - approach sim dist, tp ~16 ~ ~
# 5 - kill the final anchor of simdist calcing and teleport player back and kill again

# Keep player floating while waiting
execute unless score #teleport_state tpa.variables matches 4..5 run tp @p[tag=tpa.teleport] - 336 -
execute if score #teleport_state tpa.variables matches 0 run function tpa:teleport/anchor/approach
execute if score #teleport_state tpa.variables matches 1 run function tpa:teleport/anchor/last_approach
execute if score #teleport_state tpa.variables matches 2 run function tpa:teleport/get_destin
execute if score #teleport_state tpa.variables matches 3 as @p[tag=tpa.teleport] run function tpa:teleport/binary/approach
execute if score #teleport_state tpa.variables matches 4 run function tpa:teleport/sim_dist/approach
execute if score #teleport_state tpa.variables matches 5 as @p[tag=tpa.teleport] run function tpa:teleport/sim_dist/end
