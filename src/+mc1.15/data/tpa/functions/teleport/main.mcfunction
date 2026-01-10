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

function tpa:teleport/summon_anchor
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor] add tpa.teleport_anchor_dim_checker
tag @e[sort=nearest, limit=1, tag=tpa.teleport_anchor_dim_checker] remove tpa.teleport_anchor

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGot teleporting target dimension ", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, "(", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, ")"]

# Teleport initializations (Definition for teleport_state is at tpa:teleport/next_node)
tag @s add tpa.teleport
scoreboard players set #is_teleport_executing tpa.variables 1
scoreboard players set #teleport_state tpa.variables 0
