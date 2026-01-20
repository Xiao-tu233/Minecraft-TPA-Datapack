# Parent function: tpa:warp/iterator/main, tpa:warp/iterator/iterate

execute store result score #current_warp tpa.variables run data get storage tpa:tpa warp[0].index

# Matched and save current as outout or set current to input
execute if score #warp tpa.variables = #current_warp tpa.variables if score #op tpa.variables matches 0 run data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp[0]
execute if score #warp tpa.variables = #current_warp tpa.variables if score #op tpa.variables matches 2 run data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp[0]
execute if score #warp tpa.variables = #current_warp tpa.variables if score #op tpa.variables matches 1 run data modify storage tpa:tpa warp[0] merge from storage tpa:tpa temp.warp
execute if score #warp tpa.variables = #current_warp tpa.variables if score #op tpa.variables matches 1 run scoreboard players set #warp_editted tpa.variables 1

# Not append if current matched and op is 2
execute unless score #current_matching tpa.variables matches 1 run data modify storage tpa:tpa warp append from storage tpa:tpa warp[0]
execute if score #warp tpa.variables = #current_warp tpa.variables unless score #op tpa.variables matches 2 run data modify storage tpa:tpa warp append from storage tpa:tpa warp[0]

data remove storage tpa:tpa warp[0]
execute unless data storage tpa:tpa warp[0].sentinel run function tpa:warp/iterator/iterate