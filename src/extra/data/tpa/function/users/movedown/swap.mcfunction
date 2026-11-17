scoreboard players operation #users.swap_a tpa.variables = #users.edit.index tpa.variables
scoreboard players add #users.swap_a tpa.variables 1
scoreboard players operation #users.swap_b tpa.variables = #users.edit.index tpa.variables
function tpa:users/move/save_pair
execute if score #users.pair_valid tpa.variables matches 1 run function tpa:users/move/apply_pair
