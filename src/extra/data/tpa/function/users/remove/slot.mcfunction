# Menu wrapper: #users.remove.slot is a 1..5 relative page slot.
scoreboard players operation #users.edit.index tpa.variables = #users.remove.slot tpa.variables
scoreboard players operation #users.edit.index tpa.variables += #users.page.offset tpa.variables
scoreboard players operation #users tpa.variables = #users.edit.index tpa.variables
function tpa:users/select_index
execute if score #users.result tpa.variables matches 1 run function tpa:users/remove/selected
