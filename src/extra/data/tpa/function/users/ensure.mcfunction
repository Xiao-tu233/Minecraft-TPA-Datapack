# Called from on_join after the player's UID is available.
# This is intentionally an O(n) UUID lookup at join time only. The tick path
# remains free of users scans, while reconnects cannot create duplicate rows.
function tpa:get_name
data modify storage tpa:tpa temp.users.input.uuid set from entity @s UUID
function tpa:users/find_uuid
execute if score #users.result tpa.variables matches 0 run function tpa:users/ensure/add
execute if score #users.result tpa.variables matches 1 run function tpa:users/ensure/update
execute if score #users.result tpa.variables matches 2 run function tpa:users/ensure/conflict
