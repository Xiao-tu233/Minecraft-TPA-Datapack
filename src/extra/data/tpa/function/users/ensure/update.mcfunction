# UUID exists. Refresh the current name and let users/set preserve history.
data modify storage tpa:tpa temp.users.candidate set value {}
execute store result storage tpa:tpa temp.users.candidate.uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa temp.users.candidate.uuid set from storage tpa:tpa temp.users.input.uuid
data modify storage tpa:tpa temp.users.candidate.name set from storage tpa:tpa temp.name
function tpa:users/set
scoreboard players set #users.allow_uuid_change tpa.variables 0
