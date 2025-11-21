#> tpa:canceled_recv.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:canceled_recv"

execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rFound receiver: " ,{"selector":"@p[tag=to_modify]"}]
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBreaking loop, skipped times:" ,{"score":{"name":"#i","objective":"tpa_variables"}}]


function tpa:langtell/langtell_39
execute as @p[tag=to_modify] run function tpa:langtell/langtell_3a

tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify
scoreboard players set #j tpa_variables 0
scoreboard players set #i tpa_variables 0
