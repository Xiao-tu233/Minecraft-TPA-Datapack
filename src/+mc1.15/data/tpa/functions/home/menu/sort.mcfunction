# Parent function: tpa:home/menu

# Accendingly sort elements of temp.home according to [].number
# And fill with missing indexes

# Find the max number of homes
scoreboard players set #max tpa.variables 1
data modify storage tpa:tpa temp.home append value {sentinel: 1b}
function tpa:home/menu/sort/max
data remove storage tpa:tpa temp.home[0]

data modify storage tpa:tpa temp.home_sorted set value []
scoreboard players set #i tpa.variables 1
function tpa:home/menu/sort/ensure_index