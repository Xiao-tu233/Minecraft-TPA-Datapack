scoreboard players set #users.uuid_owner tpa.variables 0
execute store result score #users.uuid_owner tpa.variables run data get storage tpa:tpa temp.users.result.uid
execute store result score #users.uid tpa.variables run data get storage tpa:tpa temp.users.candidate.uid
execute if score #users.uuid_owner tpa.variables = #users.uid tpa.variables run function tpa:users/set_uuid/check_uid
execute unless score #users.uuid_owner tpa.variables = #users.uid tpa.variables run function tpa:users/conflict
