# Parent function: tpa:warp/enabled

# Check if warp is in range
scoreboard players set #warp.out_of_range tpa.variables 0
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 run scoreboard players set #warp.out_of_range tpa.variables 1 

execute if score #warp.out_of_range tpa.variables matches 1 run function tpa:warp/out_of_range
execute if score #warp.out_of_range tpa.variables matches 0 run function tpa:warp/within_range