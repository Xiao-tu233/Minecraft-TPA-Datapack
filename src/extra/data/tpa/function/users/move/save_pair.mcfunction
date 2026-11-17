# Read both adjacent records before the second scan rewrites them.
data remove storage tpa:tpa temp.users.swap_a
data remove storage tpa:tpa temp.users.swap_b
scoreboard players set #users.pair_valid tpa.variables 0
data remove storage tpa:tpa temp.users.input
execute store result storage tpa:tpa temp.users.input.start int 1 run scoreboard players get #users.swap_a tpa.variables
execute store result storage tpa:tpa temp.users.input.end int 1 run scoreboard players get #users.swap_a tpa.variables
function tpa:users/get_range
execute if score #users.result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.swap_a set from storage tpa:tpa temp.users.results[0]
data remove storage tpa:tpa temp.users.input
execute store result storage tpa:tpa temp.users.input.start int 1 run scoreboard players get #users.swap_b tpa.variables
execute store result storage tpa:tpa temp.users.input.end int 1 run scoreboard players get #users.swap_b tpa.variables
function tpa:users/get_range
execute if score #users.result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.swap_b set from storage tpa:tpa temp.users.results[0]
execute if data storage tpa:tpa temp.users.swap_a if data storage tpa:tpa temp.users.swap_b run scoreboard players set #users.pair_valid tpa.variables 1
