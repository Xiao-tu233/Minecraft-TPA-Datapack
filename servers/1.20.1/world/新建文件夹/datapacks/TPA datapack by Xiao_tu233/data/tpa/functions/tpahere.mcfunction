#> tpa:tpahere.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPAhere§r] §6 Debug: §rNow executing: §atpa:tpahere"

# start finding recver
execute if score @s tpahere matches 2.. store result score #i tpa_variables if entity @a[scores={player_id=2..}]
scoreboard players set #j tpa_variables 0
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{"score":{"name":"#i","objective":"tpa_variables"}}]
execute if score #i tpa_variables matches 1.. run function tpa:recv/recver_test
execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 0 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]
scoreboard players set #j tpa_variables 0
tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify

execute as @s[scores={tpahere=1}] run function tpa:langtell/langtell_60

# can't teleport yourself
execute if score @s tpahere = @s player_id run function tpa:langtell/langtell_21
execute if score @s tpahere = @s player_id run scoreboard players set @s tpahere 0
execute as @s[scores={tpahere=2..}] run scoreboard players operation @s tp_here = @s tpahere

scoreboard players set @s tpahere 0

