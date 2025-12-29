# Parent function: tpa:teleport/main
# @input: storage tpa:tpa temp.teleport.Pos: double[3], temp.teleport.Rotation: float[2], temp.teleport.Dimension: char[*]

# Function calls: main -(1 tick)-> main_0 -(1 tick)-> main_1 -(1 tick)-> main_1 -(1 tick)-> main_1 -> ... -> main_complete/stop_process

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: A teleport process has been started: §r", {"selector": "@a[tag=tpa.teleport]"}, " -> ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[0]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[1]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[2]"}]

# Get current dimension to see if player's dim is correct
scoreboard players operation #target_dimension tpa.variables = #dim_num tpa.variables
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
execute store result score #current_dimension tpa.variables run data get storage tpa:tpa temp.dimension.id
execute unless score #target_dimension tpa.variables = #current_dimension tpa.variables run tpa:teleport/anchor/reset_dimension


#! Calc the first anchor and set state
# scoreboard players set #teleport_state tpa.variables 1