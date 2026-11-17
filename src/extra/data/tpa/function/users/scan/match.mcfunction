# Private: only modes 4 and 6 mutate a record; all other reads preserve order.
execute if score #users.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.result set from storage tpa:tpa users[0]
execute if score #users.mode tpa.variables matches 4 run data modify storage tpa:tpa users[0] set from storage tpa:tpa temp.users.write
execute unless score #users.mode tpa.variables matches 6 run data modify storage tpa:tpa temp.users.results append from storage tpa:tpa users[0]
execute unless score #users.mode tpa.variables matches 6 run scoreboard players add #users.count tpa.variables 1
execute if score #users.mode tpa.variables matches 6 run scoreboard players set #users.removed tpa.variables 1
