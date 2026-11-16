# Admin API: temp.users.candidate.{uid,uuid}. A UUID already bound to another
# UID is rejected before any mutation.
scoreboard players set #users.result tpa.variables 3
scoreboard players set #users.uuid_owner tpa.variables 0
data remove storage tpa:tpa temp.users.result
function tpa:users/validate_uuid_candidate
execute if score #users.uuid_valid tpa.variables matches 1 run function tpa:users/set_uuid/check_uuid
