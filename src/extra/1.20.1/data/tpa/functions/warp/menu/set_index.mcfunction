# Parent function: tpa:warp/ensure_index, tpa:warp/menu/set_index

execute store result storage tpa:tpa warp[0].index int 1 run scoreboard players get #i tpa.variables

scoreboard players add #i tpa.variables 1
data modify storage tpa:tpa warp append from storage tpa:tpa warp[0]

data remove storage tpa:tpa warp[0]
execute unless data storage tpa:tpa warp[0].sentinel run function tpa:warp/menu/set_index