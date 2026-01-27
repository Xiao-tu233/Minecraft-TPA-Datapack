#> tpa:remove_offline.mcfunction
# 1. remove offline player's id: 

# store online players' ids => reset tpa.player_id => store back to tpa.player_id
scoreboard objectives add tpa.player_id_temp dummy
execute as @a run scoreboard players operation @s tpa.player_id_temp = @s tpa.player_id
scoreboard players operation #global_current tpa.player_id_temp = #global_current tpa.player_id
scoreboard objectives remove tpa.player_id

scoreboard objectives add tpa.player_id dummy
scoreboard players operation #global_current tpa.player_id = #global_current tpa.player_id_temp
execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_temp

# 2. idfix but without changing the order of players' id

scoreboard players set #i tpa 2
scoreboard players set #offline_count tpa 0
function tpa:list_online
scoreboard players operation #global_current tpa.player_id -= #offline_count tpa

execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_temp
scoreboard objectives remove tpa.player_id_temp
