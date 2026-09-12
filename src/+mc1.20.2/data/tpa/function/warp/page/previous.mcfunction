# Parent function: tpa:warp/available

scoreboard players remove #warp.page.result tpa.variables 1
execute if score #warp.page.result tpa.variables matches ..0 run scoreboard players set #warp.page.result tpa.variables 1
scoreboard players operation #warp.page.candidate tpa.variables = #warp.page.result tpa.variables
function tpa:warp/page/set

function tpa:warp/menu