execute if score @s tpa matches 1.. run scoreboard players operation #tp_to tpa.variables = @s tpa
scoreboard players set @s tpa 0
execute if score @s tpa.tpa matches 1.. run scoreboard players operation #tp_to tpa.variables = @s tpa.tpa
scoreboard players set @s tpa.tpa 0

function tpa:load_lang

scoreboard players set #is_menu_open tpa.variables 0

execute if score #tp_to tpa.variables matches 1 if score @s tpa.simple_menu matches 1 run function tpa:simple_menu/menu
execute if score #tp_to tpa.variables matches 1 if score @s tpa.simple_menu matches 1 run return 0

execute if score #tp_to tpa.variables matches 1 run function tpa:tpa_menu
execute if score #tp_to tpa.variables matches 1 run return 0

function tpa:tpa_condition_dealing
execute if score #condition tpa.variables matches 1..4 run return 0

execute if score #condition tpa.variables matches 5 run function tpa:tpa_change

# @p[tag=temp_modify] -> receiver requested last time (tpa.tp_to)
# @p[tag=to_modify] -> receiver requested new (tpa.tpa, tpa.tpahere)
scoreboard players operation #recver_id tpa.variables = #tp_to tpa.variables
execute store result score #is_recver_found tpa.variables run function tpa:recver_test

execute if score #is_menu_open tpa.variables matches 1 run scoreboard players set #is_recver_found tpa.variables -1
execute if score #condition tpa.variables matches 1..4 run scoreboard players set #is_recver_found tpa.variables -1
execute if score #is_recver_found tpa.variables matches 0 run function tpa:tpa/recver_not_found
execute if score #is_recver_found tpa.variables matches 1 run function tpa:tpa/recver_found
execute if score #is_recver_found tpa.variables matches 2 run function tpa:tpa/auto_recver_found

tag @a remove to_modify
tag @a remove temp_modify
scoreboard players set #tp_to tpa.variables 0