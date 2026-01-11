
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_right_part"}, ". " ]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_remove_right_part", "color": "red"} ]

# temp.home = home.$(uid).homes
function tpa:home/get_homes

scoreboard players set #is_home_found tpa.variables 0
scoreboard players set #if_sethome tpa.variables 0
data modify storage tpa:tpa temp.home_notmatch set value [{}]
data modify storage tpa:tpa temp.home_got set value []
data remove storage tpa:tpa temp.home[0]
scoreboard players set #i tpa.variables 1
execute if data storage tpa:tpa temp.home[0] run function tpa:home/iter_homes
execute if score #is_home_found tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNew home Home#",{"score": {"name": "#home", "objective": "tpa.variables"}}, " owned by ", {"selector": "@s"}, "(UID:", {"score": {"name": "@s", "objective": "tpa.uid"}}, ") has been removed."]
data modify storage tpa:tpa temp.home_src set from storage tpa:tpa temp.home_notmatch

execute unless data storage tpa:tpa temp.home_src[-1].x if data storage tpa:tpa temp.home_src[-1] run function tpa:home/strip

# temp.home_notmatch = [home for home in storage.tpa:tpa.home if home.uid != @s tpa.uid]
function tpa:home/get_homes

# temp.home_got.homes.append(temp.home_src)
# home = temp.home_notmatch + [temp.home_got]
data modify storage tpa:tpa home set from storage tpa:tpa temp.home_notmatch
data modify storage tpa:tpa temp.home_got.homes set from storage tpa:tpa temp.home_src
execute if data storage tpa:tpa temp.home_got.homes[0] run data modify storage tpa:tpa home append from storage tpa:tpa temp.home_got