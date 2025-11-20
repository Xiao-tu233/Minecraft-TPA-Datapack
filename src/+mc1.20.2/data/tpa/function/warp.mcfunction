scoreboard players operation #warp tpa.variables = @s tpa.warp
scoreboard players set @s tpa.warp 0

function tpa:load_lang

# Check if player's able to modify warps
function tpa:warp/conditions
execute if score #error_code tpa.variables matches 1..2 run return 0

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.args

# Check if player is asking for menu
execute if score #warp tpa.variables matches ..-1 run function tpa:warp/menu
execute if score #warp tpa.variables matches ..-1 run return 0

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#warp: ",{"score": {"name": "#warp","objective": "tpa.variables"}}]

# Check if warp is in range
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 run function tpa:sounds/no
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_out_of_range"}, ". " \
    ]
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [ \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_out_of_range", "color": "red"} \
    ]
execute if score #warp tpa.variables > #warp tpa.config unless score #warp tpa.config matches ..-1 run return 0

# The storage structure of tpa:tpa warp is:
# warp: {
#     <id1>: {
#         1: {x: int, y: int, z: int, dim: string[Dimension]}, 
#         2:{x,y,z,dim}, 
#         ...more warps
#     }, 
#     <id2>: {
#         1:{x,y,z,dim}, 
#         2:{x,y,z,dim}, 
#         ...more warps
#     }, 
#     ...more ids
# }

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #warp tpa.variables
function tpa:warp/get with storage tpa:tpa temp.args

# Act warp
execute if score #warp_disabled tpa.variables matches 0 run function tpa:warp/teleport with storage tpa:tpa temp.warp
execute if score #warp_disabled tpa.variables matches 1 run function tpa:warp/slot_disabled