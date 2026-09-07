# Parent function: tpa:warp/selected
data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #warp tpa.variables
function tpa:warp/get with storage tpa:tpa temp.args

# Act warp
execute if score #warp_disabled tpa.variables matches 0 run function tpa:warp/teleport with storage tpa:tpa temp.warp
execute if score #warp_disabled tpa.variables matches 1 run function tpa:warp/slot_disabled