scoreboard players set @s tpa.pos 2
execute store result score @s tpa.pos.x_temp run data get entity @s Pos[0]
execute store result score @s tpa.pos.y_temp run data get entity @s Pos[1]
execute store result score @s tpa.pos.z_temp run data get entity @s Pos[2]
scoreboard players operation @s tpa.pos.x = @s tpa.pos.x_temp
scoreboard players operation @s tpa.pos.y = @s tpa.pos.y_temp
scoreboard players operation @s tpa.pos.z = @s tpa.pos.z_temp

function tpa:load_lang
function tpa:sounds/levelup
tellraw @s [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_title"}]
tellraw @s ["  ", {text: "§b[x]§r", click_event:{action:"suggest_command",command: "/trigger tpa.pos.x set "}}, " ", {text: "§b[y]§r", click_event:{action:"suggest_command",command: "/trigger tpa.pos.y set "}}, " ", {text: "§b[z]§r", click_event:{action:"suggest_command",command: "/trigger tpa.pos.z set "}}]
tellraw @s ["  ", {storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_button_abort", color: "red", click_event:{action:"run_command",command: "/trigger tpa.pos set -1"}}]
