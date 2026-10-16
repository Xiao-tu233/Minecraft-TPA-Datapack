# Parent function: tpa:removehome

data remove storage tpa:tpa temp.home
data remove storage tpa:tpa temp.args

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{score: {name: "#home",objective: "tpa.variables"}}]

# Check if home is in range
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run function tpa:home/out_of_range
execute if score #home tpa.config matches ..-1 run function tpa:home/removehome_in_range
execute unless score #home tpa.config matches ..-1 unless score #home tpa.variables > #home tpa.config run function tpa:home/removehome_in_range
