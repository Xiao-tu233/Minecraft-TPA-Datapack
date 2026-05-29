# Parent functiom: tpa:here

function tpa:load_lang
function tpa:sounds/levelup
data remove storage tpa:tpa temp.here

# Get dimension
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
execute store result score #dim_num tpa.variables run data get storage tpa:tpa temp.dimension.id

execute store result storage tpa:tpa temp.here.id int 1 run scoreboard players get @s tpa.player_id
execute store result storage tpa:tpa temp.here.x int 1 run data get entity @s Pos[0] 1
execute store result storage tpa:tpa temp.here.y int 1 run data get entity @s Pos[1] 1
execute store result storage tpa:tpa temp.here.z int 1 run data get entity @s Pos[2] 1

execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.here.x_trans int 1 run data get entity @s Pos[0] 8
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.here.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches -1 store result storage tpa:tpa temp.here.z_trans int 1 run data get entity @s Pos[2] 8

execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.here.x_trans int 1 run data get entity @s Pos[0] 0.125
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.here.y_trans int 1 run data get entity @s Pos[1] 1
execute if score #dim_num tpa.variables matches 0 store result storage tpa:tpa temp.here.z_trans int 1 run data get entity @s Pos[2] 0.125

execute if score #dim_num tpa.variables matches 1 run tellraw @a [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, {"selector": "@s"}, " @ ", {"storage": "tpa:tpa", "nbt": "temp.here.x", "color": "light_purple"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.y", "color": "light_purple"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.z", "color": "light_purple"}]
execute if score #dim_num tpa.variables matches 0 run tellraw @a [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, {"selector": "@s"}, " @ ", {"storage": "tpa:tpa", "nbt": "temp.here.x", "color": "green"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.y", "color": "green"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.z", "color": "green"}, " §r-> ", {"storage": "tpa:tpa", "nbt": "temp.here.x_trans", "color": "red"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.y_trans", "color": "red"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.z_trans", "color": "red"}]
execute if score #dim_num tpa.variables matches -1 run tellraw @a [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, {"selector": "@s"}, " @ ", {"storage": "tpa:tpa", "nbt": "temp.here.x", "color": "red"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.y", "color": "red"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.z", "color": "red"}, " §r-> ", {"storage": "tpa:tpa", "nbt": "temp.here.x_trans", "color": "green"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.y_trans", "color": "green"}, " ", {"storage": "tpa:tpa", "nbt": "temp.here.z_trans", "color": "green"}]

effect give @s minecraft:glowing 5