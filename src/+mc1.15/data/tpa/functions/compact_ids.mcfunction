# 1. Reset offlined player's id except #global_current
scoreboard objectives add tpa.player_id_ dummy
execute as @a run scoreboard players operation @s tpa.player_id_ = @s tpa.player_id
scoreboard players operation #global_current tpa.player_id_ = #global_current tpa.player_id
scoreboard players reset * tpa.player_id
scoreboard players operation #global_current tpa.player_id = #global_current tpa.player_id_
execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_

# 2. Move online players' ids to the nearest empty id slot 
scoreboard players set #i tpa.variables 2
scoreboard players set #offline_count tpa.variables 0
function tpa:list_online
#  Make #global_current the last id slot
scoreboard players operation #global_current tpa.player_id -= #offline_count tpa.variables
#  Update players' ids
execute as @a run scoreboard players operation @s tpa.player_id = @s tpa.player_id_
scoreboard objectives remove tpa.player_id_
