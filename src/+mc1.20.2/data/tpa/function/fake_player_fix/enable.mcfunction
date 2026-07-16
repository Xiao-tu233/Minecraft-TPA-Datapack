# Called by: (player) Any OP, Quoted by: tpa:options.carpet_fake_player_fix.enable_clickEvent

scoreboard players set #is_carpet_installed tpa.variables 0
function tpa:fake_player_fix/is_carpet_installed {carpet: "carpet"}

execute if score #is_carpet_installed tpa.variables matches 1 run function tpa:fake_player_fix/installed
execute unless score #is_carpet_installed tpa.variables matches 1 run function tpa:fake_player_fix/not_installed