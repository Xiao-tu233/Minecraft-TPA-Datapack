# Parent function: tpa:home/available

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: ", {selector: "@s"}, " is visiting his/her Home#", {score: {name: "#home",objective: "tpa.variables"}}]

# Check if home is in range
execute if score #home tpa.variables > #home tpa.config run function tpa:home/out_of_range
execute unless score #home tpa.variables > #home tpa.config run function tpa:home/within_range