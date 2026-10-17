# Parent function: tpa:home/menu/sort, tpa:home/menu/sort/ensure_index

data modify storage tpa:tpa temp.home_sorted append value {number: -1}
execute store result storage tpa:tpa temp.home_sorted[-1].number int 1 run scoreboard players get #i tpa.variables

data modify storage tpa:tpa temp.home append value {sentinel: 1b}
function tpa:home/menu/sort/scan_for_index
data remove storage tpa:tpa temp.home[0]

scoreboard players add #i tpa.variables 1
execute if score #i tpa.variables <= #max tpa.variables run function tpa:home/menu/sort/ensure_index