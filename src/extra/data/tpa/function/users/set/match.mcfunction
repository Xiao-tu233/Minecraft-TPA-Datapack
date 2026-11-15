# Private: called after the parent function's checks pass.
scoreboard players set #users.existing_uid tpa.variables 0
execute store result score #users.existing_uid tpa.variables run data get storage tpa:tpa temp.users.result.uid
execute unless score #users.existing_uid tpa.variables = #users.uid tpa.variables run function tpa:users/conflict
execute if score #users.result tpa.variables matches 1 run function tpa:users/set/check_binding
