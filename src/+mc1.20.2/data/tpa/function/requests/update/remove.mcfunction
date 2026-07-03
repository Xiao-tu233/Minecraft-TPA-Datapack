# Parent function: tpa:requests/update/loop

execute store result score #direction tpa.variables run data get storage tpa:tpa requests[0].direction

tag @a remove reqer
tag @a remove recver
execute as @a if score #requests.current_reqer tpa.variables = @s tpa.uid run tag @s add reqer
execute as @a if score #requests.current_recver tpa.variables = @s tpa.uid run tag @s add recver

execute if score #requests.invalid tpa.variables matches 1 run function tpa:requests/update/time_out
execute if score #requests.invalid tpa.variables matches 2 run function tpa:requests/update/player_invalid

data remove storage tpa:tpa requests[-1]