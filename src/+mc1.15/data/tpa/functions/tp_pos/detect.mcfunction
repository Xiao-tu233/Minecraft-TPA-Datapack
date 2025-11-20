
# Fill missing values with current position: Use the fallback way that if pos is None
# The original way is not working cuz the tpa.pos has been changed that we cannot know if pos is set or not by simply checking tpa.pos
execute unless score @s tpa.pos.x_temp = @s tpa.pos.x_temp store result score @s tpa.pos.x_temp run data get entity @s Pos[0]
execute unless score @s tpa.pos.y_temp = @s tpa.pos.y_temp store result score @s tpa.pos.y_temp run data get entity @s Pos[1]
execute unless score @s tpa.pos.z_temp = @s tpa.pos.z_temp store result score @s tpa.pos.z_temp run data get entity @s Pos[2]

execute store result score #dx tpa.variables run data get entity @s Pos[0]
scoreboard players operation #dx tpa.variables -= @s tpa.pos.x_temp

execute store result score #dy tpa.variables run data get entity @s Pos[1]
scoreboard players operation #dy tpa.variables -= @s tpa.pos.y_temp

execute store result score #dz tpa.variables run data get entity @s Pos[2]
scoreboard players operation #dz tpa.variables -= @s tpa.pos.z_temp

scoreboard players operation #temp1 tpa.variables = #dx tpa.variables
scoreboard players operation #temp1 tpa.variables *= #dx tpa.variables
scoreboard players operation #dist_sq tpa.variables += #temp1 tpa.variables
scoreboard players operation #temp1 tpa.variables = #dy tpa.variables
scoreboard players operation #temp1 tpa.variables *= #dy tpa.variables
scoreboard players operation #dist_sq tpa.variables += #temp1 tpa.variables
scoreboard players operation #temp1 tpa.variables = #dz tpa.variables
scoreboard players operation #temp1 tpa.variables *= #dz tpa.variables
scoreboard players operation #dist_sq tpa.variables += #temp1 tpa.variables

scoreboard players operation #limit_sq tpa.variables = #tp_pos tpa.config
scoreboard players operation #limit_sq tpa.variables *= #tp_pos tpa.config

execute if score #dist_sq tpa.variables > #limit_sq tpa.variables if score #tp_pos tpa.config matches 1.. run scoreboard players set #condition tpa.variables 4

execute if score #condition tpa.variables matches 4 run function tpa:sounds/no
execute if score #condition tpa.variables matches 4 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.tp_pos_out_of_range"}, ". "]
execute if score #condition tpa.variables matches 4 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.tp_pos_out_of_range", "color": "red"}]

execute store result storage tpa:tpa temp.arg.x int 1 run scoreboard players get @s tpa.pos.x_temp
execute store result storage tpa:tpa temp.arg.y int 1 run scoreboard players get @s tpa.pos.y_temp
execute store result storage tpa:tpa temp.arg.z int 1 run scoreboard players get @s tpa.pos.z_temp
execute if score #condition tpa.variables matches 6 run function tpa:tp_pos/act with storage tpa:tpa temp.arg