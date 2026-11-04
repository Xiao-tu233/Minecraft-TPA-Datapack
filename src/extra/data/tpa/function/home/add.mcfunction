# Parent function: tpa:home/available
# Create the next Home slot after the player's current maximum slot.

scoreboard players operation #home tpa.variables = #home.max_id tpa.variables
scoreboard players add #home tpa.variables 1
scoreboard players set #home.trigger_state tpa.variables 1
function tpa:home/selected

scoreboard players set #home tpa.variables -9
