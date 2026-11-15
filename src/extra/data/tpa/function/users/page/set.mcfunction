# Public: @s is the viewer; input #users.page.candidate. Upsert a clamped page.
function tpa:users/page/refresh
scoreboard players set #users.page.uid tpa.variables 0
execute store result score #users.page.uid tpa.variables run scoreboard players get @s tpa.uid
execute if score #users.page.uid tpa.variables matches 1.. run function tpa:users/page/set/write
