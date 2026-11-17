scoreboard players add #users.current_slot tpa.variables 1
execute if score #users.current_slot tpa.variables = #users.target tpa.variables run data modify storage tpa:tpa users append from storage tpa:tpa temp.users.move_record
execute if score #users.current_slot tpa.variables = #users.target tpa.variables run scoreboard players set #users.inserted tpa.variables 1
data modify storage tpa:tpa users append from storage tpa:tpa users[0]
data remove storage tpa:tpa users[0]
execute unless data storage tpa:tpa users[0].sentinel run function tpa:users/set_position/insert/loop
execute if data storage tpa:tpa users[0].sentinel run function tpa:users/set_position/insert/finish
