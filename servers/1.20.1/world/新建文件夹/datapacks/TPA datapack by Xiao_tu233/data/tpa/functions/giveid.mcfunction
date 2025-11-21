#> tpa:giveid.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:giveid"
#Function used to:
#set players' player_id
scoreboard players operation @s player_id = #global_current player_id
scoreboard players add #global_current player_id 1