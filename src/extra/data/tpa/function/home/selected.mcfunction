# Parent function: tpa:home/available

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug§r: ", {selector: "@s"}, " is visiting his/her Home#", {score: {name: "#home",objective: "tpa.variables"}}]

# Recall home menu after edits
execute unless score #home.trigger_state tpa.variables matches 0 run function tpa:home/menu

# Check if home is in range
scoreboard players set #home.out_of_range tpa.variables 0
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run scoreboard players set #home.out_of_range tpa.variables 1 

# Check if home is in range
execute if score #home.out_of_range tpa.variables matches 1 run function tpa:home/out_of_range
execute if score #home.out_of_range tpa.variables matches 0 run function tpa:home/within_range
