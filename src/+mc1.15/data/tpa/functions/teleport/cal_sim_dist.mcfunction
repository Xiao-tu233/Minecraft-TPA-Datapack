# Called by: (player) Any OP, quoted by: tpa:options, tpa:teleport/anchor/warn_sim_dist
# Full Name: calculate_simulate_distance

# """
# How it works?
# Summon visual item anchors at the dist of integer times of 16
# Use "execute if entity" to see if anchor is loaded
# When it's not, save the dist and teleport player 16 blocks east to deal with the anchor
# """

# Standard Y: 336
scoreboard players set #sim_dist tpa.config 0
function tpa:teleport/summon_anchor
tag @s add tpa.teleport
scoreboard players set #teleport_state tpa.variables 4
scoreboard players set #is_teleport_executing tpa.variables 1
scoreboard players set #teleport_origin_anchor_summoned tpa.variables 0