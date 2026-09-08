# Parent function: tpa:warp/resolve_slot
scoreboard players set #warp.page.result tpa.variables 0
scoreboard players set #warp.store_result tpa.variables 1
scoreboard players set #warp.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:warp/page/scan