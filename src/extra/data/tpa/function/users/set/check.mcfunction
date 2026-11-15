# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.input.uuid set from storage tpa:tpa temp.users.candidate.uuid
scoreboard players set #users.mode tpa.variables 3
function tpa:users/scan
execute if score #users.result tpa.variables matches 1 run function tpa:users/set/match
