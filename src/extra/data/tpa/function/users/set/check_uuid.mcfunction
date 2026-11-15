data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.result.uuid
execute store success score #users.different tpa.variables run data modify storage tpa:tpa temp.users.compare set from storage tpa:tpa temp.users.candidate.uuid
execute if score #users.different tpa.variables matches 1 run function tpa:users/conflict
