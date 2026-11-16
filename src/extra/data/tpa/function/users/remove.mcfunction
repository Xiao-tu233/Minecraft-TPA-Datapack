# Public: temp.users.input.uid -> remove one record and set #users.result.
# Status: 0 not found, 1 removed, 2 ambiguous, 3 invalid input/storage.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
scoreboard players set #users.uid tpa.variables 0
execute store result score #users.uid tpa.variables run data get storage tpa:tpa temp.users.input.uid
execute if score #users.uid tpa.variables matches 1.. run function tpa:users/remove/valid
