# Parent function: tpa:warp/setname, tpa:warp/setdesc

function tpa:warp/page/get

# #warp.page.offset = (#warp.page.result -1) *5
scoreboard players operation #warp.page.offset tpa.variables = #warp.page.result tpa.variables
scoreboard players remove #warp.page.offset tpa.variables 1
scoreboard players operation #warp.page.offset tpa.variables *= #5 tpa.variables
