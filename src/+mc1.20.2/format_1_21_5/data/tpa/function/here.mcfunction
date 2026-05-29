scoreboard players set @s tpa.here 0

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #error_code tpa.variables matches 1 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.here_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.here_spec", color:"red"}]
execute if score #error_code tpa.variables matches 1 \
    run return 0

effect give @s glowing 15
function tpa:sounds/levelup

# Get dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.args.dimension set from storage tpa:tpa temp.dimension.namespaceid
execute store result score #dim_num tpa.variables run data get storage tpa:tpa temp.dimension.id
data modify storage tpa:tpa temp.args.color set from storage tpa:tpa temp.dimension.color

# Get current position
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0] 1
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1] 1
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2] 1

# Calc transformed position
execute if score #dim_num tpa.variables matches -1..0 run data modify storage tpa:tpa temp.args.if_trans set value " -> "
execute if score #dim_num tpa.variables matches -1..0 run data modify storage tpa:tpa temp.args.space_trans set value " "

execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.x_trans int 1 run data get entity @s Pos[0] 8
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.z_trans int 1 run data get entity @s Pos[2] 8

execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.x_trans int 1 run data get entity @s Pos[0] 0.125
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.z_trans int 1 run data get entity @s Pos[2] 0.125

execute if score #dim_num tpa.variables matches -1 if score #uses_string_dimension tpa.config matches 0 run data modify storage tpa:tpa temp.args.id set value 0
execute if score #dim_num tpa.variables matches -1 if score #uses_string_dimension tpa.config matches 1 run data modify storage tpa:tpa temp.args.id set value "minecraft:overworld"
execute if score #dim_num tpa.variables matches 0 if score #uses_string_dimension tpa.config matches 0 run data modify storage tpa:tpa temp.args.id set value -1
execute if score #dim_num tpa.variables matches 0 if score #uses_string_dimension tpa.config matches 1 run data modify storage tpa:tpa temp.args.id set value "minecraft:the_nether"
execute if score #dim_num tpa.variables matches -1..0 run function tpa:dimension/get
data modify storage tpa:tpa temp.args.trans_color set from storage tpa:tpa temp.dimension.color

# Get player's name and id
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get @s tpa.player_id
scoreboard players set #player_available tpa.variables 0
execute if score @s tpa.player_id matches 2.. run scoreboard players set #player_available tpa.variables 1
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
# n: char = name[0:1]
data modify storage tpa:tpa temp.args.n set string storage tpa:tpa temp.name 0 1

# Call macro function
function tpa:here_macro with storage tpa:tpa temp.args
