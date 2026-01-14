# Parent function: tpa:home, tpa:sethome, tpa:removehome

function tpa:sounds/levelup
tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_menu_title"}]

scoreboard players set #op tpa.variables 3
function tpa:home/iterator/main

#! Sort temp.home here

scoreboard players set #i tpa.variables 1
execute if data storage tpa:tpa temp.home if data storage tpa:tpa temp.home[0] run function tpa:home/menu/display_lines

# Show create button in the last place
execute if score #i tpa.variables <= #home tpa.config if score #home tpa.config matches 1.. run tellraw @s [{"text":"  ", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create_button_hoverevent"}}, "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.sethome set "}}, "[", {"storage": "tpa:tpa", "nbt": "loaded_lang.home_new"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.home_number", "color": "aqua"}, {"score": {"name": "#i", "objective": "tpa.variables"}, "color": "aqua"}, "/", {"score": {"name": "#home", "objective": "tpa.config"}}, "§r]" ]
execute if score #i tpa.variables <= #home tpa.config if score #home tpa.config matches ..-1 run tellraw @s [{"text":"  ", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create_button_hoverevent"}}, "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.sethome set "}}, "[", {"storage": "tpa:tpa", "nbt": "loaded_lang.home_new"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.home_number", "color": "aqua"}, {"score": {"name": "#i", "objective": "tpa.variables"}, "color": "aqua"}, "§r]" ]