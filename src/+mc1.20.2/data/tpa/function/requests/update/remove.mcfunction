execute store result score #reqer tpa.variables run data get storage tpa:tpa temp.matched_requests[0].reqer
execute store result score #recver tpa.variables run data get storage tpa:tpa temp.matched_requests[0].recver
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.matched_requests[0].direction
tag @a remove reqer
tag @a remove recver
execute as @a if score #recver tpa.variables = @s tpa.uid run tag @s add reqer
execute as @a if score #recver tpa.variables = @s tpa.uid run tag @s add recver

execute if score #requests.invalid tpa.variables matches 1 run function tpa:requests/update/time_out
execute if score #requests.invalid tpa.variables matches 2 run function tpa:requests/update/player_invalid

data remove storage tpa:tpa requests[-1]