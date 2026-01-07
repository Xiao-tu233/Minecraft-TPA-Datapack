# Parent function: tpa:compact_ids

# for (int i = 2; i< #global_current; i++)
execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow Pointer(#i) @ ", {"score": {"name": "#i", "objective": "tpa.variables"}}, "/", {"score": {"name": "#global_current", "objective": "tpa.player_id"}}]

# #j: bool = len(@a[@s.player_id == #i] (is_target_player_unanvail)
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables run scoreboard players add #j tpa.variables 1
# if(#j){#offline_count: int +=1;}
execute unless score #j tpa.variables matches 1.. run scoreboard players add #offline_count tpa.variables 1

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rSo far found: ", {"score": {"name": "#offline_count", "objective": "tpa.variables"}}, " players are offline/spectating/fake players." ]
execute as @a if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: ", {"selector": "@s"}, "§r with id of ", {"score": {"name": "@s", "objective": "tpa.player_id_"}} ]

# temp.back = back[@a[@s.player_id == #i].player_id_]
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables run scoreboard players operation #target_id tpa.variables = @s tpa.player_id_
function tpa:back/get

# @a[@s.player_id == #i].player_id_ -= #offline_count
scoreboard players set #j tpa.variables 0
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id_ = #i tpa.variables run scoreboard players operation @s tpa.player_id_ -= #offline_count tpa.variables

# back[@a[@s.player_id == #i].player_id_] = temp.back
execute as @a[scores={tpa.player_id=2..}] if score @s tpa.player_id = #i tpa.variables if score #offline_count tpa.variables matches 1.. run scoreboard players operation #target_id tpa.variables = @s tpa.player_id_
function tpa:back/set

# For looping
scoreboard players add #i tpa.variables 1
execute if score #i tpa.variables < #global_current tpa.player_id run function tpa:list_online