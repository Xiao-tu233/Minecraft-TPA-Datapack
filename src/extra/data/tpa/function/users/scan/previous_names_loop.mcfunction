data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.names[0]
execute store success score #users.different tpa.variables run data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.input.name
execute if score #users.different tpa.variables matches 0 run scoreboard players set #users.matches tpa.variables 1
data remove storage tpa:tpa temp.users.names[0]
execute unless score #users.matches tpa.variables matches 1 if data storage tpa:tpa temp.users.names[0] run function tpa:users/scan/previous_names_loop
