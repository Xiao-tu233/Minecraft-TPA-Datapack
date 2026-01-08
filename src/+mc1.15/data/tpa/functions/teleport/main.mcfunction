# Parent function:

# Usage example:
# scoreboard players set #debug_mode tpa.config 1
# data modify storage tpa:tpa temp.teleport set value {Pos: [1024d, 4d, 512d], Rotation: [0.0f, 0.0f], Dimension: 0}

# Resolve target dimension
data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.teleport.Dimension
function tpa:dimension/get
execute store result score #destin_dimension tpa.variables run data get storage tpa:tpa temp.dimension.id
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
execute store result score #current_dimension tpa.variables run data get storage tpa:tpa temp.dimension.id
execute unless score #destin_dimension tpa.variables = #current_dimension tpa.variables run function tpa:teleport/reset_dimension

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGot teleporting target dimension ", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, "(", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, ")"]

# Teleport initializations (Definition for teleport_state is at tpa:teleport/next_node)
tag @s add tpa.teleport
scoreboard players set #is_teleporting_executing tpa.variables 1
scoreboard players get #teleport_state tpa.variables

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