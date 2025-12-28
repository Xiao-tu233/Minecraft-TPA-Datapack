# Called by: (player) Any OP, quoted by: tpa:options
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
function tpa:teleport/cal_sim_dist/loop

scoreboard players operation #sim_dist tpa.variables = #sim_dist tpa.config
scoreboard players remove #sim_dist tpa.config 2
scoreboard players operation #sim_dist tpa.variables *= #16 tpa.variables
scoreboard players remove #sim_dist tpa.variables 1

# Go 16 blocks east and kill the final anchor which cannot be reached
function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_anchor_
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] remove tpa.teleport_anchor

tp @s ~16 336 ~
scoreboard players set #teleport_state tpa.variables 3
kill @e[tag=tpa.teleport_anchor]