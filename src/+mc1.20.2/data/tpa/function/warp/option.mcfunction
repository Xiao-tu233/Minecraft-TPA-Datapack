# Called by: (player) Any OP, quoted by: tpa:options
scoreboard players set #warp.editting tpa.variables 1

execute store result score #warp tpa.config run data get storage tpa:tpa warp
scoreboard players remove #warp tpa.config 1

# Get Page for slot start
function tpa:warp/page/get
execute if score #warp.page.result tpa.variables matches 0 run function tpa:warp/page/create

# Calc total pages
scoreboard players operation #warp.total_pages tpa.variables = #warp tpa.config
scoreboard players add #warp.total_pages tpa.variables 4
scoreboard players operation #warp.total_pages tpa.variables /= #5 tpa.variables

execute if score #warp tpa.config matches 0 run function tpa:warp/option/empty
execute if score #warp tpa.config matches 1.. run function tpa:warp/menu
