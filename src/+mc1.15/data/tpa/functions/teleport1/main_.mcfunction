
# @input: storage tpa:tpa temp.teleport.Pos: double[3], temp.teleport.Rotation: float[2], temp.teleport.Dimension: char[*]

# Function calls: main -(1 tick)-> main_0 -(1 tick)-> main_1 -(1 tick)-> main_1 -(1 tick)-> main_1 -> ... -> main_complete/stop_process

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: A teleport process has been started: §r", {"selector": "@s"}, " -> ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[0]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[1]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[2]"}]

# Target block is updated in 1.16 we seporate versions by check if we could give player this item
execute unless score #is_1_16 tpa.config = #is_1_16 tpa.config run scoreboard players set #is_1_16 tpa.config 0
execute unless score #is_1_16 tpa.config = #is_1_16 tpa.config store result score #is_1_16 tpa.config run function tpa:teleport/give_target

scoreboard players set #is_dimension_loaded tpa.variables 1
scoreboard players set #is_teleport_executing tpa.variables 1
scoreboard players set #teleport_load_awaits tpa.variables 0
scoreboard players set #teleport_summon_retried tpa.variables -1
tag @s add teleport

execute if score #is_1_16 tpa.config matches 1 run function tpa:teleport/dimension_check_1_16
execute if score #is_1_16 tpa.config matches 0 run function tpa:teleport/dimension_check_1_15

execute if score #target_dimension tpa.variables matches 0 in minecraft:overworld unless score #target_dimension tpa.variables = #current_dimension tpa.variables run tp 0 336 0
execute if score #target_dimension tpa.variables matches 1 in minecraft:the_end unless score #target_dimension tpa.variables = #current_dimension tpa.variables run tp 0 336 0
execute if score #target_dimension tpa.variables matches -1 in minecraft:the_nether unless score #target_dimension tpa.variables = #current_dimension tpa.variables run tp 0 336 0
# Usage example:
# scoreboard players set #debug_mode tpa.config 1
# data modify storage tpa:tpa temp.teleport set value {Pos: [1024d, 4d, 512d], Rotation: [0.0f, 0.0f], Dimension: 0}
# function tpa:teleport/main