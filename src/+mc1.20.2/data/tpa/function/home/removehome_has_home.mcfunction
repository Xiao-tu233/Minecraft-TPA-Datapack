# Parent function: tpa:home/removehome_in_range

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
scoreboard players set #is_exist tpa.variables 0
function tpa:home/is_exist with storage tpa:tpa temp.args

# If he has one, but the provided id is not valid, tell him home's not found.
execute if score #is_exist tpa.variables matches 0 run function tpa:home/not_found
execute unless score #is_exist tpa.variables matches 0 run function tpa:home/removehome_remove
