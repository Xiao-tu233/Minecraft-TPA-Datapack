# Parent function: tpa:warp/resolve_slot
data remove storage tpa:tpa temp.warp_page_scan
scoreboard players set #warp.page.result tpa.variables 0
scoreboard players set #warp.page.store_result tpa.variables 0
scoreboard players set #warp.page.replace_current tpa.variables 1
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:warp/page/scan

# Insert if not found
execute unless data storage tpa:tpa temp.warp_page_scan run function tpa:warp/page/append
scoreboard players operation #warp.page.result tpa.variables = #warp.page.candidate tpa.variables