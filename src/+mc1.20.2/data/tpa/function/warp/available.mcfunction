# Parent function: tpa:warp
execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

execute if score #warp tpa.config matches 0 run function tpa:warp/disabled
execute if score #warp tpa.config matches 1.. run function tpa:warp/enabled
