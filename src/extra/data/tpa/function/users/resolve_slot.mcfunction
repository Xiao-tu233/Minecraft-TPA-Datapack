# Public: @s is the viewer, #users is -3..-7 for the five relative slots.
# Output #users.selected_uid and temp.users.result; page buttons are separate.
scoreboard players set #users.selected_uid tpa.variables 0
scoreboard players set #users.result tpa.variables 3
data remove storage tpa:tpa temp.users.result
execute if score #users tpa.variables matches -7..-3 run function tpa:users/resolve_slot/valid
