data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa users[0].name
execute store success score #users.different tpa.variables run data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.input.name
execute if score #users.different tpa.variables matches 0 run scoreboard players set #users.matches tpa.variables 1
