# Parent Function: tpa:tpa, tpa:back, tpa:tpaccept, tpa:list_online
data remove storage tpa:tpa temp.arg
execute store result storage tpa:tpa temp.arg.id int 1 run scoreboard players get @s tpa.player_id
function tpa:back/store_pos_macro with storage tpa:tpa temp.arg