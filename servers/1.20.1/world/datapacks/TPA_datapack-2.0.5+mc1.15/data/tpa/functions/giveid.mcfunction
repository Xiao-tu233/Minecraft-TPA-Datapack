scoreboard players operation @s tpa.player_id = #global_current tpa.player_id
scoreboard players add #global_current tpa.player_id 1
data remove storage tpa:tpa temp
execute store result storage tpa:tpa temp.id int 1 run scoreboard players get @s tpa.player_id