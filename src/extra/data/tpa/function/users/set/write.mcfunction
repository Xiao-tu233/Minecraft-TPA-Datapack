# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.write set from storage tpa:tpa temp.users.result
execute unless data storage tpa:tpa temp.users.write.previous_names run data modify storage tpa:tpa temp.users.write.previous_names set value []
execute if data storage tpa:tpa temp.users.write.name run function tpa:users/set/remember_name
data modify storage tpa:tpa temp.users.write.uuid set from storage tpa:tpa temp.users.candidate.uuid
data modify storage tpa:tpa temp.users.write.name set from storage tpa:tpa temp.users.candidate.name
scoreboard players set #users.mode tpa.variables 4
function tpa:users/scan
