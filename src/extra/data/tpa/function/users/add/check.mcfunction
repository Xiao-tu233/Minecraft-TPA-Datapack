# Private: called after the parent function's checks pass.
data modify storage tpa:tpa temp.users.input.uuid set from storage tpa:tpa temp.users.candidate.uuid
scoreboard players set #users.mode tpa.variables 3
function tpa:users/scan
execute unless score #users.result tpa.variables matches 3 run function tpa:users/add/check_result
