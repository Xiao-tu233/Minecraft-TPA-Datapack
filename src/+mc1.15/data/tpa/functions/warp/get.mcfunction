# Parent function: tpa:warp
# @macro: {index: int}
# @output: temp.warp
scoreboard players set #op tpa.variables 0
function tpa:warp/iterator/main

execute store result score #warp_disabled tpa.variables run data get storage tpa:tpa temp.warp.disabled
execute if score #warp_disabled tpa.variables matches 0 run data modify storage tpa:tpa temp.warp set from storage tpa:tpa temp.warp