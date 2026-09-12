# Called by: (player) Any OP, quoted by: tpa:options
scoreboard players set #warp.editting tpa.variables 1

# Get Page for slot start
function tpa:warp/page/get
execute if score #warp.page.result tpa.variables matches 0 run function tpa:warp/page/create

# Calc total pages
scoreboard players operation #warp.total_pages tpa.variables = #warp tpa.config
scoreboard players add #warp.total_pages tpa.variables 4
scoreboard players operation #warp.total_pages tpa.variables /= #5 tpa.variables

function tpa:warp/menu