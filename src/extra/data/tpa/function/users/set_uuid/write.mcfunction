data modify storage tpa:tpa temp.users.write set from storage tpa:tpa temp.users.result
data modify storage tpa:tpa temp.users.write.uuid set from storage tpa:tpa temp.users.candidate.uuid
scoreboard players set #users.uid tpa.variables 0
execute store result score #users.uid tpa.variables run data get storage tpa:tpa temp.users.candidate.uid
scoreboard players set #users.mode tpa.variables 4
function tpa:users/scan
scoreboard players set #users.result tpa.variables 1
