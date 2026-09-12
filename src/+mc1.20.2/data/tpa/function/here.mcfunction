scoreboard players set @s tpa.here 0

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

effect give @s glowing 15
function tpa:sounds/levelup

data remove storage tpa:tpa temp.args

# Get dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.dimension.namespaceid
execute store result score #dim_num tpa.variables run data get storage tpa:tpa temp.dimension.id
data modify storage tpa:tpa temp.args.color set from storage tpa:tpa temp.dimension.color
data modify storage tpa:tpa temp.args.dimension_before_trans set from storage tpa:tpa temp.dimension.name

# Get current position
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0]
data modify storage tpa:tpa temp.args.x set string storage tpa:tpa temp.args.x
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1]
data modify storage tpa:tpa temp.args.y set string storage tpa:tpa temp.args.y
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.args.z set string storage tpa:tpa temp.args.z

# Calc transformed position
execute if score #dim_num tpa.variables matches 0 run function tpa:here/overworld
execute if score #dim_num tpa.variables matches -1 run function tpa:here/nether
execute unless score #dim_num tpa.variables matches -1..0 run function tpa:here/other_dims


# Get player's name and id
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
# n: char = name[0:1]
data modify storage tpa:tpa temp.args.n set string storage tpa:tpa temp.name 0 1

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get @s tpa.uid

execute if predicate tpa:available run function tpa:here/available
execute unless predicate tpa:available run function tpa:here/unavailable

# Call macro function
function tpa:here/display with storage tpa:tpa temp.args
