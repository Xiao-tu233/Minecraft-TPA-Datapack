execute unless score #users.inserted tpa.variables matches 1 run data modify storage tpa:tpa users append from storage tpa:tpa temp.users.move_record
data remove storage tpa:tpa users[0]
data remove storage tpa:tpa temp.users.move_record
scoreboard players set #users.result tpa.variables 1
