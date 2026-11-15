# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.write set from storage tpa:tpa temp.users.candidate
execute unless data storage tpa:tpa temp.users.write.previous_names run data modify storage tpa:tpa temp.users.write.previous_names set value []
execute store success score #users.written tpa.variables run data modify storage tpa:tpa users append from storage tpa:tpa temp.users.write
execute unless score #users.written tpa.variables matches 1 run scoreboard players set #users.result tpa.variables 3
execute if score #users.written tpa.variables matches 1 run function tpa:users/add/success
