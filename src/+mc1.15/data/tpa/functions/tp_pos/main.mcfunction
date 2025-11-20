scoreboard players set @s tpa.pos 2
execute store result score @s tpa.pos.x_temp run data get entity @s Pos[0]
execute store result score @s tpa.pos.y_temp run data get entity @s Pos[1]
execute store result score @s tpa.pos.z_temp run data get entity @s Pos[2]
scoreboard players operation @s tpa.pos.x = @s tpa.pos.x_temp
scoreboard players operation @s tpa.pos.y = @s tpa.pos.y_temp
scoreboard players operation @s tpa.pos.z = @s tpa.pos.z_temp

function tpa:load_lang
function tpa:sounds/levelup
tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_title"}]
tellraw @s ["  ", {"text": "§b[x]§r", "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.pos.x set "}}, " ", {"text": "§b[y]§r", "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.pos.y set "}}, " ", {"text": "§b[z]§r", "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.pos.z set "}}]
tellraw @s ["  ", {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_button_abort", "color": "red", "clickEvent": {"action": "run_command", "value": "/trigger tpa.pos set -1"}}]
