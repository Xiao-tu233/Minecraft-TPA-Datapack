# Public: temp.users.input.uid -> remove one offline record and set #users.result.
# This forgets the current users index; it does not revoke the player's UID.
# Status: 0 not found, 1 removed, 2 ambiguous, 3 invalid input/storage,
#         4 target player is currently online.
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
scoreboard players set #users.uid tpa.variables 0
function tpa:users/get
execute if score #users.result tpa.variables matches 1 as @a if score @s tpa.uid = #users.uid tpa.variables run scoreboard players set #users.result tpa.variables 4
execute if score #users.result tpa.variables matches 1 run function tpa:users/remove/valid
