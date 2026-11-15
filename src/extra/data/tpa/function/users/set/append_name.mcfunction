# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.old_name set from storage tpa:tpa temp.users.write.name
data modify storage tpa:tpa temp.users.names set from storage tpa:tpa temp.users.write.previous_names
scoreboard players set #users.name_seen tpa.variables 0
execute if data storage tpa:tpa temp.users.names[0] run function tpa:users/set/check_previous_name
execute unless score #users.name_seen tpa.variables matches 1 run data modify storage tpa:tpa temp.users.write.previous_names append from storage tpa:tpa temp.users.old_name
