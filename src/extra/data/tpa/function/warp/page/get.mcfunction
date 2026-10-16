# Parent function: tpa:warp/enabled
scoreboard players set #warp.page.result tpa.variables 0
scoreboard players set #warp.page.store_result tpa.variables 1
scoreboard players set #warp.page.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:warp/page/scan