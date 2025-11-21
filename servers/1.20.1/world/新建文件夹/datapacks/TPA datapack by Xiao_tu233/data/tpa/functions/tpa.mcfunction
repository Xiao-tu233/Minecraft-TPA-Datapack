#> tpa:tpa.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tpa"
# Parent function: tpa:tick
execute as @s[scores={tpa=1}] run function tpa:langtell/langtell_20
# can't teleport yourself
execute if score @s tpa = @s player_id run function tpa:langtell/langtell_21
execute if score @s tpa = @s player_id run scoreboard players set @s tpa 0
# store tp target
execute as @s[scores={tpa=2..}] run scoreboard players operation @s tp_to = @s tpa

# start find recver
execute if score @s tpa matches 2.. store result score #i tpa_variables if entity @a[scores={player_id=2..}]
scoreboard players set #j tpa_variables 0
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop starts, times: ",{"score":{"name":"#i","objective":"tpa_variables"}}]
execute if score #i tpa_variables matches 1.. run function tpa:recv/recver_test
execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 0 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]
scoreboard players set #j tpa_variables 0
tag @a remove to_except_being_selected
tag @s remove self
tag @a remove to_modify

scoreboard players set @s tpa 0
