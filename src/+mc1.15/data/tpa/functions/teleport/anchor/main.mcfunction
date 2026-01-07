# Parent function: tpa:teleport/main
# @input: storage tpa:tpa temp.teleport.Pos: double[3], temp.teleport.Rotation: float[2], temp.teleport.Dimension: char[*]

# Function calls: main -(1 tick)-> main_0 -(1 tick)-> main_1 -(1 tick)-> main_1 -(1 tick)-> main_1 -> ... -> main_complete/stop_process

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §aA teleport process has been started: §r", {"selector": "@a[tag=tpa.teleport]"}, " -> ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[0]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[1]"}, " ", {"storage": "tpa:tpa", "nbt": "temp.teleport.Pos[2]"}]

#! Calc the first anchor and set state
# scoreboard players set #teleport_state tpa.variables 1