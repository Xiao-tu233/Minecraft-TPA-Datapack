# Parent function: tpa:warp/menu

data remove storage tpa:tpa warp[0]
scoreboard players set #i tpa.variables 1
data modify storage tpa:tpa warp append value {sentinel: 1b}

function tpa:warp/menu/set_index

data modify storage tpa:tpa warp[0] set value {}