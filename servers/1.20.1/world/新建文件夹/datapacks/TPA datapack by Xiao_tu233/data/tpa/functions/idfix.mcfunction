#> tpa:idfix.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:idfix"
#Function used to:
#Reset #global_current player_id to avoid the so large amount of player_id than even greater than 20
scoreboard players set @s idfix 0
scoreboard players set #global_current player_id 1

execute if score #tp_spec tpa_config matches 0 run scoreboard players set @a player_id 0
execute if score #tp_spec tpa_config matches 1 run scoreboard players set @a[gamemode=!spectator] player_id 0