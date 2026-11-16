data modify storage tpa:tpa temp.users.input.uid set from storage tpa:tpa temp.users.candidate.uid
function tpa:users/get
execute if score #users.result tpa.variables matches 1 run function tpa:users/set_uuid/write
