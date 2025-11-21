
function tpa:sounds/levelup
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_menu_title"}]

# temp.home = home.$(uid).homes
function tpa:home/get_homes

scoreboard players set #i tpa.variables 1
data remove storage tpa:tpa temp.home[0]
execute if data storage tpa:tpa temp.home if score #is_uid_found tpa.variables matches 1 run function tpa:home/display_homes

execute if score #i tpa.variables <= #home tpa.config if score #home tpa.config matches 1.. run tellraw @s[scores={tpa.output=1..2}] [{"text":"  ", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_create_button_hoverevent"}}, "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.sethome set "}}, "[", {"storage": "tpa:tpa", "nbt": "temp.lang.home_new"}, {"storage": "tpa:tpa", "nbt": "temp.lang.home_number", "color": "aqua"}, {"score": {"name": "#i", "objective": "tpa.variables"}, "color": "aqua"}, "/", {"score": {"name": "#home", "objective": "tpa.config"}}, "§r]" ]
execute if score #i tpa.variables <= #home tpa.config if score #home tpa.config matches ..-1 run tellraw @s[scores={tpa.output=1..2}] [{"text":"  ", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_create_button_hoverevent"}}, "clickEvent": {"action": "suggest_command", "value": "/trigger tpa.sethome set "}}, "[", {"storage": "tpa:tpa", "nbt": "temp.lang.home_new"}, {"storage": "tpa:tpa", "nbt": "temp.lang.home_number", "color": "aqua"}, {"score": {"name": "#i", "objective": "tpa.variables"}, "color": "aqua"}, "§r]" ]

