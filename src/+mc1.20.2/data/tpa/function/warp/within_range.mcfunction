# Parent function: tpa:warp/selected
function tpa:warp/get

execute store result score #warp.disabled tpa.variables run data get storage tpa:tpa temp.warp_result.disabled
data modify storage tpa:tpa temp.args set from storage tpa:tpa temp.warp_result 

# Act warp
execute if score #warp.disabled tpa.variables matches 1 run function tpa:warp/slot_disabled
execute if score #warp.disabled tpa.variables matches 0 run function tpa:warp/teleport with storage tpa:tpa temp.args