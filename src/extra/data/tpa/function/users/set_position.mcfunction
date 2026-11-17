# Public: temp.users.input {uid, index} -> move one unique UID to a 1-based slot.
# Status: 0 unchanged/not found, 1 moved or already at the requested slot,
#         2 ambiguous UID, 3 invalid input/storage.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
data remove storage tpa:tpa temp.users.move_record
scoreboard players set #users.uid tpa.variables 0
scoreboard players set #users.target tpa.variables 0
execute store result score #users.uid tpa.variables run data get storage tpa:tpa temp.users.input.uid
execute store result score #users.target tpa.variables run data get storage tpa:tpa temp.users.input.index
execute if score #users.uid tpa.variables matches 1.. if score #users.target tpa.variables matches 1.. run function tpa:users/set_position/valid
