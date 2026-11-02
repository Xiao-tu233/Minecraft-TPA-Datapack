# Parent function: tpa:home/resolve_slot
data remove storage tpa:tpa temp.home_page_scan
scoreboard players set #home.page.result tpa.variables 0
scoreboard players set #home.page.store_result tpa.variables 0
scoreboard players set #home.page.replace_current tpa.variables 1
scoreboard players set #home.page.update_max_id tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/page/scan

# Insert if not found
execute unless data storage tpa:tpa temp.home_page_scan run function tpa:home/page/append
scoreboard players operation #home.page.result tpa.variables = #home.page.candidate tpa.variables
