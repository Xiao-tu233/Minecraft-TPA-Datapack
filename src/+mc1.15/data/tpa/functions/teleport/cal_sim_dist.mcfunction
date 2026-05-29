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

# Debugs
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_cal_sim_dist_start"}, ". "]
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSimulate distance Calculating has been started with origin position @", {"entity": "@s", "nbt": "Pos"}, ". ", {"score":{"objective":"tpa.config","name":"#sim_dist"}, "color": "green"}, " is the original simulate distance before calculating. "]