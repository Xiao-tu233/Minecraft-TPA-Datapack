execute unless score @s tpa.home matches 0 run scoreboard players operation #home tpa.variables = @s tpa.home
execute unless score @s home matches 0 run scoreboard players operation #home tpa.variables = @s home
scoreboard players set @s tpa.home 0
scoreboard players set @s home 0

function tpa:load_lang
function tpa:home/conditions
scoreboard players operation #uid tpa.variables = @s tpa.uid

data remove storage tpa:tpa temp.home

# Check if player is asking for menu
execute if score #error_code tpa.variables matches 0 if score #home tpa.variables matches ..-1 run function tpa:home/menu

# Otherwise, teleport to the specified home
execute if score #error_code tpa.variables matches 0 if score #home tpa.variables matches 1.. run function tpa:home/get
# Act teleport using interface written
execute if data storage tpa:tpa temp.home.x if score #home tpa.variables matches 1.. run function tpa:home/teleport

# Before v2.0.5:
# The storage structure of tpa:tpa home is:
# home: [
#     {
#         uid: int,
#         homes: [
#            {}, # First slot for existence test
#            {x: int, y: int, z: int, dim: string[Dimension]}, 
#            {x,y,z,dim}, 
#            ...more homes
#     }, 
#     {
#         uid: int,
#         homes: [
#            {}, # First slot for existence test
#            {x: int, y: int, z: int, dim: string[Dimension]}, 
#            {}, # Empty slot for future homes
#            {x,y,z,dim}, 
#            ...more homes
#         ]
#     }, 
#     ...more ids
# ]

# After 2.0.6:
# [{uid, x, y, z, number}, ...]

# Example Usage:
# data modify storage tpa:tpa home set value [{uid: 0, homes: [{}, {x: 0, y: 4, z: 0, dim: 0}, {}, {x: -5, y: 9, z: -5, dim: 0}]}, {uid: 1, homes: [{}, {x: 0, y: -60, z: 0, dim: 0}, {}, {x: -5, y: 0, z: -5, dim: 0}]}]