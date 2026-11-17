# Private: called after the parent function's checks pass.
execute if score #users.page.candidate tpa.variables matches ..0 run scoreboard players set #users.page.candidate tpa.variables 1
execute if score #users.page.candidate tpa.variables > #users.total_pages tpa.variables run scoreboard players operation #users.page.candidate tpa.variables = #users.total_pages tpa.variables
data remove storage tpa:tpa temp.users_page_scan
scoreboard players set #users.page.store_result tpa.variables 0
scoreboard players set #users.page.replace_current tpa.variables 1
scoreboard players set #users.page.remove_current tpa.variables 0
function tpa:users/page/scan
execute if score #users.page.scan_ok tpa.variables matches 1 run function tpa:users/page/set/commit
