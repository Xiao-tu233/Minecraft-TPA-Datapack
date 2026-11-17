# Private: insert the captured record at the requested 1-based position.
data modify storage tpa:tpa temp.users.move_record set from storage tpa:tpa temp.users.result
data remove storage tpa:tpa temp.users.result
scoreboard players set #users.current_slot tpa.variables 0
scoreboard players set #users.inserted tpa.variables 0
data modify storage tpa:tpa users append value {sentinel: 1b}
execute unless data storage tpa:tpa users[0].sentinel run function tpa:users/set_position/insert/loop
execute if data storage tpa:tpa users[0].sentinel run function tpa:users/set_position/insert/finish
