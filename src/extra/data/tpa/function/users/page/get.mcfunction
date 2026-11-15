# Public: @s is the viewer. Output #users.page.result and #users.total_pages.
# Missing saved pages default to 1; stale saved pages are clamped and persisted.
function tpa:users/page/refresh
scoreboard players set #users.page.result tpa.variables 1
scoreboard players set #users.page.uid tpa.variables 0
execute store result score #users.page.uid tpa.variables run scoreboard players get @s tpa.uid
execute if score #users.page.uid tpa.variables matches 1.. run function tpa:users/page/get/read
