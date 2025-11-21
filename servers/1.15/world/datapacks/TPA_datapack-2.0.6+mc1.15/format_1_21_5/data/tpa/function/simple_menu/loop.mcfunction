execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow #i:",{score:{"name":"#i","objective":"tpa.variables"}}]

# Count players with that id (0 or 1 in fact)
scoreboard players set #j tpa.variables 0
execute as @a if score @s tpa.player_id = #i tpa.variables run scoreboard players add #j tpa.variables 1

# Macro call
execute store result storage tpa:tpa temp.simple_menu.i int 1 run scoreboard players get #i tpa.variables
execute if score #j tpa.variables matches 1.. run function tpa:simple_menu/add with storage tpa:tpa temp.simple_menu

# i++
scoreboard players add #i tpa.variables 1

# i >= #global_current: break
execute if score #i tpa.variables >= #global_current tpa.player_id run return 0

# Recursive call
function tpa:simple_menu/loop