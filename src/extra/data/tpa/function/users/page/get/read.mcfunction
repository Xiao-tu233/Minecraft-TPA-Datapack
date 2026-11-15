# Private: called after the parent function's checks pass.
scoreboard players set #users.page.store_result tpa.variables 1
scoreboard players set #users.page.replace_current tpa.variables 0
function tpa:users/page/scan
scoreboard players operation #users.page.candidate tpa.variables = #users.page.result tpa.variables
execute if score #users.page.result tpa.variables matches ..0 run function tpa:users/page/set
execute if score #users.page.result tpa.variables > #users.total_pages tpa.variables run function tpa:users/page/set
