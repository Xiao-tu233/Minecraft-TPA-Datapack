#> tpa:tpadeny.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tpadeny"
#This function is used to
#Deal with tpaccept = -1
#Tell tp request was denied
scoreboard players set @s[scores={tpaccept=-1}] accept -1

#Realizing the python-style program below function tpa:tpaccept
execute store result score #i tpa_variables if entity @a[tag=tp_reqer]
execute if score #i tpa_variables matches 1.. run function tpa:reqer_test

# $execute as @a if score @s tp_to matches $(player_id) run \
# execute as @a[scores={player_id=$(player_id),accept=-1}] run function tpa:tp_denied with storage tpa:tpa

# $scoreboard players set @a[scores={tp_to=$(player_id)}] tp_to 0
scoreboard players set @s tpaccept 0
scoreboard players set @s[scores={tpaccept_toggle=0}] accept 0
