# Parent function: tpa:home/enabled
scoreboard players set #home.page.result tpa.variables 0
scoreboard players set #home.max_id tpa.variables 0
scoreboard players set #home.page.store_result tpa.variables 1
scoreboard players set #home.page.replace_current tpa.variables 0
scoreboard players set #home.page.update_max_id tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/page/scan
