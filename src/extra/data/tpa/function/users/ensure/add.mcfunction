# UUID was not found. Add a complete record using the existing UID.
data modify storage tpa:tpa temp.users.candidate set value {}
execute store result storage tpa:tpa temp.users.candidate.uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa temp.users.candidate.uuid set from storage tpa:tpa temp.users.input.uuid
data modify storage tpa:tpa temp.users.candidate.name set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.users.candidate.previous_names set value []
function tpa:users/add
