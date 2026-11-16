data modify storage tpa:tpa temp.users.input.uid set from storage tpa:tpa temp.users_edit.uid
function tpa:users/get
execute if score #users.result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.candidate set from storage tpa:tpa temp.users.result
execute if score #users.result tpa.variables matches 1 run data modify storage tpa:tpa temp.users.candidate.name set from storage tpa:tpa temp.users_edit.name
scoreboard players set #users.allow_uuid_change tpa.variables 0
execute if score #users.result tpa.variables matches 1 run function tpa:users/set
dialog clear @s
function tpa:users/option
