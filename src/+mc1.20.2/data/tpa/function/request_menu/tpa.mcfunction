# Parent function: tpa:tick

scoreboard players reset #recver tpa.variables
scoreboard players set #request_menu.opened tpa.variables 0
scoreboard players set #request_menu.direction tpa.variables 0

scoreboard players set #request_menu.value tpa.variables 0
execute if score @s tpa matches -23..-2 run scoreboard players operation #request_menu.value tpa.variables = @s tpa
function tpa:request_menu/handle_pending_value
scoreboard players set #request_menu.value tpa.variables 0
execute if score @s tpa.tpa matches -23..-2 run scoreboard players operation #request_menu.value tpa.variables = @s tpa.tpa
function tpa:request_menu/handle_pending_value

scoreboard players set @s tpa -1
scoreboard players set @s tpa.tpa -1
execute unless score #request_menu.opened tpa.variables matches 1 if score #recver tpa.variables = #recver tpa.variables run scoreboard players operation @s tpa.tpa = #recver tpa.variables
execute unless score #request_menu.opened tpa.variables matches 1 if score @s tpa.tpa matches 1.. run function tpa:tpa
