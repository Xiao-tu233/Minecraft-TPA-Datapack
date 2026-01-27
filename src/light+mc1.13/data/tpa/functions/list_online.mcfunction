#> tpa:list_online.mcfunction
# execute if score #debug_mode tpa.config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:list_online"
# Parent function: tpa:reset_online
# i is iterable target, while j is to count if some player has the player id, cuz: 
# No one have tpa.player_id equals to i => #j == 0 => the id with this id is offlined =
# => take 1 score from everyone whose id's greater than the offlined one
execute as @a if score @s tpa.player_id = #i tpa run scoreboard players add #j tpa 1
execute unless score #j tpa matches 1.. run scoreboard players add #offline_count tpa 1
scoreboard players set #j tpa 0
execute as @a if score @s tpa.player_id_temp = #i tpa run scoreboard players operation @s tpa.player_id -= #offline_count tpa

# For looping
scoreboard players add #i tpa 1
execute if score #i tpa < #global_current tpa.player_id run function tpa:list_online