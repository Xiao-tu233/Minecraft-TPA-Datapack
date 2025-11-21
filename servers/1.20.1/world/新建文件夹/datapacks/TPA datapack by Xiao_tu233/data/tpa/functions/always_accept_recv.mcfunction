#> tpa:always_accept_recv.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:always_accept_recv"

execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rFound receiver: " ,{"selector":"@p[tag=to_modify]"}]
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBreaking loop, skipped times:" ,{"score":{"name":"#i","objective":"tpa_variables"}}]


tp @s @p[tag=to_modify]
execute as @s run function tpa:langtell/langtell_33
execute as @s[scores={tpa=2..}] run function tpa:langtell/langtell_38
execute as @p[tag=to_modify] run function tpa:langtell/langtell_37
scoreboard players set @s tp_to 0

tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify
scoreboard players set #j tpa_variables 0
scoreboard players set #i tpa_variables 0
