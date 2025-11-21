#> tpa:recv/recv_tpahere.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:recv_tpahere"

# Parent Function: tpa:recv/recver_test
function tpa:langtell/langtell_62
execute as @p[tag=to_modify] run function tpa:langtell/langtell_63
# start timer
scoreboard players operation @s timer = #time_out tpa_config

execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rFound receiver: " ,{"selector":"@p[tag=to_modify]"}]
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBreaking loop, skipped times:" ,{"score":{"name":"#i","objective":"tpa_variables"}}]
tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify
scoreboard players set #j tpa_variables 0
scoreboard players set #i tpa_variables 0