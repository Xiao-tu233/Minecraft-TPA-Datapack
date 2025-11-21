
execute if score #back tpa.config matches 1 run return 1
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run return 2

data remove storage tpa:tpa temp.arg
execute store result storage tpa:tpa temp.arg.id int 1 run scoreboard players get @s tpa.player_id
function tpa:back/temp with storage tpa:tpa temp.arg
execute unless score #flag tpa.variables matches 1 run return 3

function tpa:back/store_pos
function tpa:back/act with storage tpa:tpa temp.back

execute if score #debug_mode tpa.config matches 0 run data remove storage tpa:tpa temp.back
execute if score #debug_mode tpa.config matches 0 run scoreboard players set #flag tpa.variables 0