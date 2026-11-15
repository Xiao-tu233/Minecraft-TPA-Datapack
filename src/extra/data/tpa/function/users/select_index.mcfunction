# Public: #users is an absolute 1-based menu position, NOT a UID.
# Resolves a real record; an empty last-page slot returns status 0.
scoreboard players set #users.selected_uid tpa.variables 0
data remove storage tpa:tpa temp.users.result
execute store result storage tpa:tpa temp.users.input.start int 1 run scoreboard players get #users tpa.variables
execute store result storage tpa:tpa temp.users.input.end int 1 run scoreboard players get #users tpa.variables
function tpa:users/get_range
execute if score #users.result tpa.variables matches 1 run function tpa:users/select_index/found
