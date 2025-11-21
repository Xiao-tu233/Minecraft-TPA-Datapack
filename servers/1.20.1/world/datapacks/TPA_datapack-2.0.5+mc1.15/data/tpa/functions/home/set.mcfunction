data modify storage tpa:tpa temp.home_src set value {}
execute store result storage tpa:tpa temp.home_src.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.home_src.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.home_src.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.home_src.dim set from entity @s Dimension
function tpa:sounds/pick_orb
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_middle_part"}, {"storage":"tpa:tpa", "nbt":"temp.home_src.dim"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_position"}, {"storage":"tpa:tpa", "nbt":"temp.home_src.x"}, " ", {"storage":"tpa:tpa", "nbt":"temp.home_src.y"}, " ", {"storage":"tpa:tpa", "nbt":"temp.home_src.z"}, " ", {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_right_part"}, "." ]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.home_set_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_middle_part"}, {"storage":"tpa:tpa", "nbt":"temp.home_src.dim"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_position"}, {"storage":"tpa:tpa", "nbt":"temp.home_src.x"}, " ", {"storage":"tpa:tpa", "nbt":"temp.home_src.y"}, " ", {"storage":"tpa:tpa", "nbt":"temp.home_src.z"}, " ", {"storage":"tpa:tpa", "nbt":"temp.lang.home_set_right_part"}]

# temp.home = home.$(uid).homes
function tpa:home/get_homes
data remove storage tpa:tpa temp.home_newprofile
data modify storage tpa:tpa temp.home_newprofile set value {uid: -1, homes: [{}]}
execute if score #is_uid_found tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNew home profile of ", {"selector": "@s"}, "(UID:", {"score": {"name": "@s", "objective": "tpa.uid"}}, ") has been created. "]
execute if score #is_uid_found tpa.variables matches 0 store result storage tpa:tpa temp.home_newprofile.uid int 1 run scoreboard players get @s tpa.uid
execute if score #is_uid_found tpa.variables matches 0 run data modify storage tpa:tpa home append from storage tpa:tpa temp.home_newprofile
execute if score #is_uid_found tpa.variables matches 0 run data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_newprofile.homes

# temp.home = temp.home[0: #home] + temp.home_src + temp.home[#home+ 1: ]
scoreboard players set #is_home_found tpa.variables 0
scoreboard players set #if_sethome tpa.variables 1
data modify storage tpa:tpa temp.home_notmatch set value [{}]
data modify storage tpa:tpa temp.home_got set value []
data remove storage tpa:tpa temp.home[0]
scoreboard players set #i tpa.variables 1
execute if data storage tpa:tpa temp.home[0] run function tpa:home/iter_homes
execute if score #is_home_found tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNew home Home#",{"score": {"name": "#home", "objective": "tpa.variables"}}, " owned by ", {"selector": "@s"}, "(UID:", {"score": {"name": "@s", "objective": "tpa.uid"}}, ") has been created."]
execute if score #is_home_found tpa.variables matches 0 run scoreboard players remove #i tpa.variables 1
execute if score #is_home_found tpa.variables matches 0 run function tpa:home/new
data modify storage tpa:tpa temp.home_src set from storage tpa:tpa temp.home_notmatch

# temp.home_notmatch = [home for home in storage.tpa:tpa.home if home.uid != @s tpa.uid]
function tpa:home/get_homes

# temp.home_got.homes.append(temp.home_src)
# home = temp.home_notmatch + [temp.home_got]
data modify storage tpa:tpa home set from storage tpa:tpa temp.home_notmatch
data modify storage tpa:tpa temp.home_got.homes set from storage tpa:tpa temp.home_src
data modify storage tpa:tpa home append from storage tpa:tpa temp.home_got