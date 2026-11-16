# Public: temp.users.candidate {uid,uuid,name}.
# Update an existing UID or bind an unbound UID. Reject UUID reassignment.
# Preserve existing extra fields/history; append the old name on rename.
scoreboard players set #users.result tpa.variables 3
execute unless score #users.allow_uuid_change tpa.variables matches 1 run scoreboard players set #users.allow_uuid_change tpa.variables 0
execute unless score #users.allow_uuid_change tpa.variables matches 1 run scoreboard players set #users.allow_uuid_change tpa.variables 0
data remove storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.results set value []
function tpa:users/validate
execute if score #users.valid tpa.variables matches 1 run function tpa:users/set/check
