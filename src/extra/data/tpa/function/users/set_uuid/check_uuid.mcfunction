data modify storage tpa:tpa temp.users.input.uuid set from storage tpa:tpa temp.users.candidate.uuid
function tpa:users/find_uuid
execute if score #users.result tpa.variables matches 0 run function tpa:users/set_uuid/check_uid
execute if score #users.result tpa.variables matches 1 run function tpa:users/set_uuid/check_owner
execute if score #users.result tpa.variables matches 2 run function tpa:users/conflict
