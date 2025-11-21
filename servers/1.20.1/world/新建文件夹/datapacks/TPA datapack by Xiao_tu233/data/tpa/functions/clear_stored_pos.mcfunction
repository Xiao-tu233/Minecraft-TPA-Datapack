#> tpa:clear_stored_pos.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:clear_stored_pos"

function tpa:back_find_storage

# i--
scoreboard players remove #i tpa_variables 1

execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 1.. run tellraw @a ["[§bTPA§r] §6 Debug: §rRemain loop times: §a",{"score":{"name":"#i","objective":"tpa_variables"}}]

execute if score #i tpa_variables matches 1.. run function tpa:clear_stored_pos