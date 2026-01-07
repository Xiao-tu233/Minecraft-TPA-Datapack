# Parent function: tpa:teleport/main

execute if score #target_dimension tpa.variables matches 0 in minecraft:overworld run tp 0 336 0
execute if score #target_dimension tpa.variables matches 1 in minecraft:the_end run tp 0 336 0
execute if score #target_dimension tpa.variables matches -1 in minecraft:the_nether run tp 0 336 0