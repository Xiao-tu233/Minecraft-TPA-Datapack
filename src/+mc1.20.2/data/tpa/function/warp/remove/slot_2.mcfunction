# Called by: (Player) Any OP, quoted by: tpa:warp/menu

function tpa:warp/page/get

# #warp.page.offset = (#warp.page.result -1) *5
scoreboard players operation #warp.page.offset tpa.variables = #warp.page.result tpa.variables
scoreboard players remove #warp.page.offset tpa.variables 1
scoreboard players operation #warp.page.offset tpa.variables *= #5 tpa.variables

scoreboard players set #warp.selected_slot tpa.variables 2

scoreboard players operation #warp.selected_slot tpa.variables += #warp.page.offset tpa.variables
scoreboard players operation #warp tpa.variables = #warp.selected_slot tpa.variables
function tpa:warp/remove

function tpa:warp/option