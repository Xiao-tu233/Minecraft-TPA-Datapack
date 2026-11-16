# Private. Always rotate the current entry exactly once, even on a match.
scoreboard players add #users.current_slot tpa.variables 1
scoreboard players set #users.current_uid tpa.variables 0
execute store result score #users.current_uid tpa.variables run data get storage tpa:tpa users[0].uid
scoreboard players set #users.matches tpa.variables 0
execute if score #users.mode tpa.variables matches 0 if score #users.current_uid tpa.variables = #users.uid tpa.variables run scoreboard players set #users.matches tpa.variables 1
execute if score #users.mode tpa.variables matches 1 if data storage tpa:tpa users[0].uuid run function tpa:users/scan/uuid
execute if score #users.mode tpa.variables matches 2 run function tpa:users/scan/name
execute if score #users.mode tpa.variables matches 3 run function tpa:users/scan/conflict
execute if score #users.mode tpa.variables matches 4 if score #users.current_uid tpa.variables = #users.uid tpa.variables run scoreboard players set #users.matches tpa.variables 1
execute if score #users.mode tpa.variables matches 5 if score #users.current_slot tpa.variables >= #users.start tpa.variables if score #users.current_slot tpa.variables <= #users.end tpa.variables run scoreboard players set #users.matches tpa.variables 1
execute if score #users.mode tpa.variables matches 6 if score #users.current_uid tpa.variables = #users.uid tpa.variables run scoreboard players set #users.matches tpa.variables 1
execute if score #users.matches tpa.variables matches 1 run function tpa:users/scan/match
execute if score #users.mode tpa.variables matches 7 if score #users.current_slot tpa.variables = #users.swap_a tpa.variables run data modify storage tpa:tpa users[0] set from storage tpa:tpa temp.users.swap_b
execute if score #users.mode tpa.variables matches 7 if score #users.current_slot tpa.variables = #users.swap_b tpa.variables run data modify storage tpa:tpa users[0] set from storage tpa:tpa temp.users.swap_a
execute unless score #users.mode tpa.variables matches 6 run data modify storage tpa:tpa users append from storage tpa:tpa users[0]
data remove storage tpa:tpa users[0]
execute unless data storage tpa:tpa users[0].sentinel run function tpa:users/scan/loop
