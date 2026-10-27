# Parent function: tpa:teleport/next_node(teleport_state==0)

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rconfirmed target to be in target dimension ", {"entity": "@e[sort=nearest, limit=1, tag=tpa.teleport_anchor_dim_checker]", "nbt": "Dimension"}, ""]
kill @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_dim_checker]

# Summon destin anchor @ destination
function tpa:teleport/summon_destin_anchor

execute if score #uses_binary_teleport tpa.config matches 0 if score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/anchor/main
execute if score #uses_binary_teleport tpa.config matches 0 unless score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/anchor/warn_sim_dist
execute if score #uses_binary_teleport tpa.config matches 1 run function tpa:teleport/binary/main

# If destin anchor can be directly access, just tp it on next tick
execute if entity @e[sort=nearest, limit=1, tag=tpa.teleport_destin_anchor] run scoreboard players set #teleport_state tpa.variables 2


#! Teleport to-do list:
# - for binary teleport, we just need to call the main function every tick until destin anchor is loaded
# - for binary teleport, we need a percentage displaying which shows the percentage of now distance dividing by origin distance
# - for anchor teleport, the percentage should be showed according to the count of anchors which haven't been teleported yet dividing by count of anchors needed in the whole process
# [] for sim dist calc, actionbar should also show the currently chunks we've traveled if 