# Private: called after the parent function's checks pass.
execute unless data storage tpa:tpa users[0].sentinel run function tpa:users/scan/loop
data remove storage tpa:tpa users[0]
scoreboard players set #users.result tpa.variables 0
execute if score #users.mode tpa.variables matches 6 if score #users.removed tpa.variables matches 1 run scoreboard players set #users.result tpa.variables 1
execute if score #users.mode tpa.variables matches 7 run scoreboard players set #users.result tpa.variables 1
execute if score #users.count tpa.variables matches 1.. run scoreboard players set #users.result tpa.variables 1
execute unless score #users.mode tpa.variables matches 5 if score #users.count tpa.variables matches 2.. run scoreboard players set #users.result tpa.variables 2
execute if score #users.result tpa.variables matches 1 unless score #users.mode tpa.variables matches 5 run data modify storage tpa:tpa temp.users.result set from storage tpa:tpa temp.users.results[0]
