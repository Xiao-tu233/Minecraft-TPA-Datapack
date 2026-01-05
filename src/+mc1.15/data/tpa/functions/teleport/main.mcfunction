# Parent function:

# Usage example:
# scoreboard players set #debug_mode tpa.config 1
# data modify storage tpa:tpa temp.teleport set value {Pos: [1024d, 4d, 512d], Rotation: [0.0f, 0.0f], Dimension: 0}

# Resolve target dimension
data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.teleport.Dimension
function tpa:dimension/get
execute store result score #dim_num tpa.variables run data get storage tpa:tpa temp.dimension.id

# Debugs
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rGot teleporting target dimension ", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, "(", {"storage": "tpa:tpa", "nbt": "temp.dimension.namespaceid"}, ")"]

# Teleport initializations (Definition for teleport_state is at tpa:teleport/next_node)
tag @s add tpa.teleport
scoreboard players set #is_teleporting_executing tpa.variables 1
scoreboard players set #teleport_state tpa.variables 0

execute if score #uses_binary_teleport tpa.config matches 1 run function tpa:teleport/binary/main
execute if score #uses_binary_teleport tpa.config matches 0 if score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/anchor/main
execute if score #uses_binary_teleport tpa.config matches 0 unless score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/anchor/warn_sim_dist


# execute if score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:teleport/main__

# execute unless score #sim_dist tpa.config = #sim_dist tpa.config run function tpa:sounds/no
# execute unless score #sim_dist tpa.config = #sim_dist tpa.config run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.teleport_tryagain"}, "."]
# execute unless score #sim_dist tpa.config = #sim_dist tpa.config run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.teleport_tryagain", "color": "red"}]
# execute unless score #sim_dist tpa.config = #sim_dist tpa.config as @p run function tpa:teleport/cal_sim_dist
