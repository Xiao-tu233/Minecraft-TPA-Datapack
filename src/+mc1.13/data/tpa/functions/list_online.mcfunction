# Parent function: tpa:remove_offline
# i is iterable target, while j is to count if some player has the player id, cuz: 
# No one have tpa.player_id equals to i => #j == 0 => the id with this id is offlined =
# => take 1 score from everyone whose id's greater than the offlined one
#! #offline_count here also counts the spectator players
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow #i: ",{"score":{"name":"#i","objective":"tpa.variables"}}]

execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables run scoreboard players add #j tpa.variables 1
execute unless score #j tpa.variables matches 1.. run scoreboard players add #offline_count tpa.variables 1

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSo far found: ",{"score":{"name":"#offline_count","objective":"tpa.variables"}}," players are offline/spectating/fake players."]

execute as @a if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: ",{"selector":"@s"},"§r with id of ",{"score":{"name":"@s","objective":"tpa.player_id_"}}]

scoreboard players set #j tpa.variables 0
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id_ = #i tpa.variables run scoreboard players operation @s tpa.player_id_ -= #offline_count tpa.variables

# For looping
scoreboard players add #i tpa.variables 1
execute if score #i tpa.variables < #global_current tpa.player_id run function tpa:list_online