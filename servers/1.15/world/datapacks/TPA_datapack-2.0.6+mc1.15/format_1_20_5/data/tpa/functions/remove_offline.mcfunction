
scoreboard objectives remove tpa.is_online
scoreboard objectives add tpa.is_online dummy
scoreboard players set @a tpa.is_online 1
execute if score #remove_offline tpa.config matches 0 run return 0

# 1. remove offline player's id: 

# store online players' ids => reset tpa.player_id => store back to tpa.player_id
scoreboard objectives add tpa.player_id_temp dummy
execute as @a[tag=!fake_player] run scoreboard players operation @s tpa.player_id_temp = @s tpa.player_id
scoreboard players operation #global_current tpa.player_id_temp = #global_current tpa.player_id
scoreboard objectives remove tpa.player_id

scoreboard objectives add tpa.player_id dummy
scoreboard players operation #global_current tpa.player_id = #global_current tpa.player_id_temp
execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_temp

# 2. Reset ids but without changing the order of players' id

scoreboard players set #i tpa.variables 2
scoreboard players set #offline_count tpa.variables 0
function tpa:list_online
scoreboard players operation #global_current tpa.player_id -= #offline_count tpa.variables

execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_temp
scoreboard objectives remove tpa.player_id_temp
