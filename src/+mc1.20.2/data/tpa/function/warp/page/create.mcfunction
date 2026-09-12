# Parent function: tpa:warp/enabled
scoreboard players set #warp.page.candidate tpa.variables 1
scoreboard players operation #warp.page.result tpa.variables = #warp.page.candidate tpa.variables
function tpa:warp/page/append