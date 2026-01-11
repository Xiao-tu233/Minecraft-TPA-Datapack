scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0
function tpa:load_lang
function tpa:home/conditions

data remove storage tpa:tpa temp.home
execute if score #error_code tpa.variables matches 0 run function tpa:home/check_home

execute if score #error_code tpa.variables matches 0 run function tpa:home/remove
function tpa:home/menu
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_right_part"}, ". " ]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_remove_right_part", "color": "red"} ]
