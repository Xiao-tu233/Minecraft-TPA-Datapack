scoreboard players operation #warp tpa.variables = @s tpa.warp
scoreboard players set @s tpa.warp 0

function tpa:load_lang

# Check if player's able to modify warps
function tpa:warp/conditions

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.args

# Check if player is asking for menu
scoreboard players set #warp_menu_open tpa.variables 0
execute if score #error_code tpa.variables matches 0 if score #warp tpa.variables matches ..-1 run function tpa:warp/menu

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#warp: ",{"score": {"name": "#warp","objective": "tpa.variables"}}]

# The storage structure of tpa:tpa warp is:
# warp: {
# <id1>: {
# 1: {x: int, y: int, z: int, dim: string[Dimension]}, 
# 2:{x,y,z,dim}, 
# ...more warps
# }, 
# <id2>: {
# 1:{x,y,z,dim}, 
# 2:{x,y,z,dim}, 
# ...more warps
# }, 
# ...more ids
# }

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #warp tpa.variables
execute if score #error_code tpa.variables matches 0 if score #warp_menu_open tpa.variables matches 0 run function tpa:warp/get

# Act warp
execute if score #warp_disabled tpa.variables matches 0 if data storage tpa:tpa temp.warp.x run function tpa:warp/teleport
execute if score #warp_disabled tpa.variables matches 1 run function tpa:warp/slot_disabled