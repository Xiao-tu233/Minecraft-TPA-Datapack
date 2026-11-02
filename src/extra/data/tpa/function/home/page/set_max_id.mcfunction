# Parent function: tpa:home/menu
# Persist the maximum Home slot found by tpa:home/scan for this player's UID.

data remove storage tpa:tpa temp.home_page_scan
scoreboard players set #home.page.store_result tpa.variables 0
scoreboard players set #home.page.replace_current tpa.variables 0
scoreboard players set #home.page.update_max_id tpa.variables 1
execute if score #home.page.result tpa.variables matches ..0 run scoreboard players set #home.page.result tpa.variables 1
scoreboard players operation #home.page.candidate tpa.variables = #home.page.result tpa.variables
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/page/scan

# Create the page record if this player did not have one yet.
execute unless data storage tpa:tpa temp.home_page_scan run function tpa:home/page/append
