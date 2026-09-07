# Parent function: tpa:warp/available
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#warp: ",{score: {name: "#warp",objective: "tpa.variables"}}]

# Check if warp is in range
scoreboard players set #warp.out_of_range tpa.variables 0
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 run scoreboard players set #warp.out_of_range tpa.variables 1 

execute if score #warp.out_of_range tpa.variables matches 1 run function tpa:warp/out_of_range
execute if score #warp.out_of_range tpa.variables matches 0 run function tpa:warp/within_range