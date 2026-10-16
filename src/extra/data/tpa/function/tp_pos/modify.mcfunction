scoreboard players operation #input_checker tpa.variables = @s tpa.pos
scoreboard players remove #input_checker tpa.variables 2
# isXInputted: bool = input_checker // 1 % 2 == 1
# isYInputted: bool = input_checker // 2 % 2 == 1
# isZInputted: bool = input_checker // 4 % 2 == 1
scoreboard players operation #is_x_inputted tpa.variables = #input_checker tpa.variables
scoreboard players operation #is_x_inputted tpa.variables %= #2 tpa.variables

scoreboard players operation #is_y_inputted tpa.variables = #input_checker tpa.variables
scoreboard players operation #is_y_inputted tpa.variables /= #2 tpa.variables
scoreboard players operation #is_y_inputted tpa.variables %= #2 tpa.variables

scoreboard players operation #is_z_inputted tpa.variables = #input_checker tpa.variables
scoreboard players operation #is_z_inputted tpa.variables /= #4 tpa.variables
scoreboard players operation #is_z_inputted tpa.variables %= #2 tpa.variables

execute if score #is_x_inputted tpa.variables matches 0 if score #condition tpa.variables matches 7 run scoreboard players add @s tpa.pos 1
execute if score #is_y_inputted tpa.variables matches 0 if score #condition tpa.variables matches 8 run scoreboard players add @s tpa.pos 2
execute if score #is_z_inputted tpa.variables matches 0 if score #condition tpa.variables matches 9 run scoreboard players add @s tpa.pos 4

execute if score #condition tpa.variables matches 7 run scoreboard players set #is_x_inputted tpa.variables 1
execute if score #condition tpa.variables matches 8 run scoreboard players set #is_y_inputted tpa.variables 1
execute if score #condition tpa.variables matches 9 run scoreboard players set #is_z_inputted tpa.variables 1 

execute if score #is_x_inputted tpa.variables matches 1 run scoreboard players operation @s tpa.pos.x_temp = @s tpa.pos.x
execute if score #is_x_inputted tpa.variables matches 1 run scoreboard players operation @s tpa.pos.y_temp = @s tpa.pos.y
execute if score #is_x_inputted tpa.variables matches 1 run scoreboard players operation @s tpa.pos.z_temp = @s tpa.pos.z

data modify storage tpa:tpa temp.tp_pos.menu_x set value '[x]'
data modify storage tpa:tpa temp.tp_pos.menu_y set value '[y]'
data modify storage tpa:tpa temp.tp_pos.menu_z set value '[z]'
execute if score #is_x_inputted tpa.variables matches 1 store result storage tpa:tpa temp.tp_pos.menu_x int 1 run scoreboard players get @s tpa.pos.x_temp
execute if score #is_y_inputted tpa.variables matches 1 store result storage tpa:tpa temp.tp_pos.menu_y int 1 run scoreboard players get @s tpa.pos.y_temp
execute if score #is_z_inputted tpa.variables matches 1 store result storage tpa:tpa temp.tp_pos.menu_z int 1 run scoreboard players get @s tpa.pos.z_temp

function tpa:tp_pos/dialog

function tpa:sounds/pick_orb
tellraw @s [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_title"}]
tellraw @s ["  ", {color: "aqua", storage: "tpa:tpa", nbt: "temp.tp_pos.menu_x", click_event:{action:"suggest_command",command: "/trigger tpa.pos.x set "}}, " ", {color: "aqua", storage: "tpa:tpa", nbt: "temp.tp_pos.menu_y", click_event:{action:"suggest_command",command: "/trigger tpa.pos.y set "}}, " ", {color: "aqua", storage: "tpa:tpa", nbt: "temp.tp_pos.menu_z", click_event:{action:"suggest_command",command: "/trigger tpa.pos.z set "}}]
tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_button_teleport", color: "green", click_event:{action:"run_command",command: "/trigger tpa.pos set -2"}}, " ", {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_button_abort", color: "red", click_event:{action:"run_command",command: "/trigger tpa.pos set -1"}}]