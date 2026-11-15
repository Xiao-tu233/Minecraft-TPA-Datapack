# Private: compare native UUID arrays without macros or text conversion.
data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa users[0].uuid
execute store success score #users.different tpa.variables run data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.input.uuid
execute if score #users.different tpa.variables matches 0 run scoreboard players set #users.matches tpa.variables 1
