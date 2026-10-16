# Parent function: tpa:tick

function tpa:load_lang

scoreboard players reset #recver tpa.variables
scoreboard players set #request_menu.opened tpa.variables 0
scoreboard players set #request_menu.direction tpa.variables 1
scoreboard players set #request_menu.render tpa.variables 0

scoreboard players set #request_menu.value tpa.variables 0
execute if score @s tpa.tpahere matches -23..-2 run scoreboard players operation #request_menu.value tpa.variables = @s tpa.tpahere
function tpa:request_menu/handle_value


scoreboard players set @s tpa.tpahere -1
execute unless score #request_menu.opened tpa.variables matches 1 if score #recver tpa.variables = #recver tpa.variables run scoreboard players operation @s tpa.tpahere = #recver tpa.variables
execute unless score #request_menu.opened tpa.variables matches 1 if score @s tpa.tpahere matches 1.. run function tpa:tpahere

execute if score #request_menu.render tpa.variables matches 2 if score #request_menu.opened tpa.variables matches 1 run function tpa:request_menu/display/dialog/show
