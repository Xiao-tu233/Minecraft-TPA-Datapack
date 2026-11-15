# Private: only mode 4 mutates a record; all reads preserve list order.
execute if score #users.mode tpa.variables matches 4 run data modify storage tpa:tpa users[0] set from storage tpa:tpa temp.users.write
data modify storage tpa:tpa temp.users.results append from storage tpa:tpa users[0]
scoreboard players add #users.count tpa.variables 1
