# Public: temp.users.candidate {uid,uuid,name,previous_names?}.
# Caller allocates the UID. No teleport, config, menu or score-holder side effects.
# Status 2 means the UID or UUID is already registered; no data is changed.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
function tpa:users/validate
execute if score #users.valid tpa.variables matches 1 run function tpa:users/add/check
