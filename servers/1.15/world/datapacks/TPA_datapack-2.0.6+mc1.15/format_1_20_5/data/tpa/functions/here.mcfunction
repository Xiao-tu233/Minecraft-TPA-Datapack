scoreboard players set @s tpa.here 0

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

scoreboard players set #error_code tpa.variables 0
execute if score #tp_spec tpa.config matches 0 if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1

execute if score #error_code tpa.variables matches 1 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.here_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.here_spec", "color":"red"}]
execute if score #error_code tpa.variables matches 1 \
    run return 0

effect give @s glowing 5
function tpa:sounds/levelup
data remove storage tpa:tpa temp.here

data remove storage tpa:tpa temp.args
data remove storage tpa:tpa temp.string_map
data modify storage tpa:tpa temp.args.dimension set from entity @s Dimension
data modify storage tpa:tpa temp.args.src set from entity @s Dimension
data modify storage tpa:tpa temp.string_map set value {"minecraft:overworld": 0b, "minecraft:the_nether": -1b, "minecraft:the_end": 1b}
execute store result score #dim_num tpa.variables run function tpa:string_map with storage tpa:tpa temp.args

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get @s tpa.player_id
execute store result storage tpa:tpa temp.args.x int 1 run data get entity @s Pos[0] 1
execute store result storage tpa:tpa temp.args.y int 1 run data get entity @s Pos[1] 1
execute store result storage tpa:tpa temp.args.z int 1 run data get entity @s Pos[2] 1

execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.x_trans int 1 run data get entity @s Pos[0] 8
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.args.z_trans int 1 run data get entity @s Pos[2] 8

execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.x_trans int 1 run data get entity @s Pos[0] 0.125
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.args.z_trans int 1 run data get entity @s Pos[2] 0.125

execute if score #dim_num tpa.variables matches -1..0 run data modify storage tpa:tpa temp.args.if_trans set value " -> "

function tpa:get_id
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
# n: char = name[0:1]
data modify storage tpa:tpa temp.args.n set string storage tpa:tpa temp.name 0 1
function tpa:here_macro with storage tpa:tpa temp.args


