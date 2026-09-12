# Parent function: tpa:warp/available

scoreboard players add #warp.page.result tpa.variables 1
execute if score #warp.page.result tpa.variables >= #warp.total_pages tpa.variables run scoreboard players operation #warp.page.result tpa.variables = #warp.total_pages tpa.variables
scoreboard players operation #warp.page.candidate tpa.variables = #warp.page.result tpa.variables
function tpa:warp/page/set

function tpa:warp/menu