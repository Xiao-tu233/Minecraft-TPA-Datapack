execute if score @s tpa matches 1.. run scoreboard players operation #tp_to tpa.variables = @s tpa
scoreboard players set @s tpa 0
execute if score @s tpa.tpa matches 1.. run scoreboard players operation #tp_to tpa.variables = @s tpa.tpa
scoreboard players set @s tpa.tpa 0

function tpa:load_lang

scoreboard players set #is_tpa_menu_open tpa.variables 0
execute if score #tp_to tpa.variables matches 1 run function tpa:tpa_menu
execute unless score #is_tpa_menu_open tpa.variables matches 1 run function tpa:tpa_condition_dealing

# @p[tag=temp_modify] -> receiver requested last time (tpa.tp_to)
# @p[tag=to_modify] -> receiver requested new (tpa.tpa, tpa.tpahere)
execute if score #condition tpa.variables matches 5 run function tpa:tpa_change

scoreboard players operation #recver_id tpa.variables = #tp_to tpa.variables
function tpa:recver_test

execute if score #is_tpa_menu_open tpa.variables matches 1 run scoreboard players set #is_recver_found tpa.variables -1
execute if score #condition tpa.variables matches 1..4 run scoreboard players set #is_recver_found tpa.variables -1
execute if score #is_recver_found tpa.variables matches 0 run function tpa:tpa/recver_not_found
execute if score #is_recver_found tpa.variables matches 1 run function tpa:tpa/recver_found
execute if score #is_recver_found tpa.variables matches 2 run function tpa:tpa/auto_recver_found

tag @a remove to_modify
tag @a remove temp_modify
scoreboard players set #tp_to tpa.variables 0