# Called by: (player) Any OP, quoted by: tpa:warp/menu
# Calc total pages
scoreboard players operation #warp.total_pages tpa.variables = #warp tpa.config
scoreboard players add #warp.total_pages tpa.variables 4
scoreboard players operation #warp.total_pages tpa.variables /= #5 tpa.variables

scoreboard players remove #warp.page.result tpa.variables 1
execute if score #warp.page.result tpa.variables matches ..0 run scoreboard players set #warp.page.result tpa.variables 1
scoreboard players operation #warp.page.candidate tpa.variables = #warp.page.result tpa.variables
function tpa:warp/page/set

scoreboard players set #warp.editting tpa.variables 1
function tpa:warp/menu