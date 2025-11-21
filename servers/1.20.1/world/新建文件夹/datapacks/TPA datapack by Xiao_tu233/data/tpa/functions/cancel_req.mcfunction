#> tpa:cancel_req.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:cancel_req"

execute store result score #i tpa_variables if entity @a[tag=tp_reqer]
scoreboard players set #j tpa_variables 1
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{"score":{"name":"#i","objective":"tpa_variables"}}]
function tpa:recv/recver_test
execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 0 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]
tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify

scoreboard players set @s tp_here 0
scoreboard players set @s tp_to 0
scoreboard players set @s cancel_req 0