# Parent function: tpa:warp
data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.args

execute if score #warp tpa.variables matches -9 run function tpa:warp/next_page
execute if score #warp tpa.variables matches -8..-3 run function tpa:warp/slot
execute if score #warp tpa.variables matches -2 run function tpa:warp/previous_page
execute if score #warp tpa.variables matches -1 run function tpa:warp/menu
execute if score #warp tpa.variables matches 1.. run function tpa:warp/selected