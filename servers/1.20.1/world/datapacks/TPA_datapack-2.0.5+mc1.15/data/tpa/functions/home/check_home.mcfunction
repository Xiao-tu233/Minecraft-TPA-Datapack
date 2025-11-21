execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{"score": {"name": "#home","objective": "tpa.variables"}}]

# temp.home = home[uid].homes
function tpa:home/get_homes
# temp.home = temp.home[id]
function tpa:home/get_home

# #error_code == 4: player visited home which doesn't exist
execute if score #is_home_found tpa.variables matches 0 run scoreboard players set #error_code tpa.variables 4

# #error_code == 5: player has no home
execute if score #is_uid_found tpa.variables matches 0 run scoreboard players set #error_code tpa.variables 5

# If he has one, but the provided id is not valid, tell him home's not found.
execute if score #error_code tpa.variables matches 4 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 4 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_right_part"}, ". " ]
execute if score #error_code tpa.variables matches 4 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_not_found_right_part", "color": "red"} ]

# Tip the player if he hasn't had a home yet
execute if score #error_code tpa.variables matches 5 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 5 run tellraw @s[scores={tpa.output=0..1}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.home_create"}, ". ", {    "storage":"tpa:tpa", "nbt":"temp.lang.home_create_button", "clickEvent": {"action": "run_command", "value": "/trigger tpa.sethome"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_create_button_hoverevent"}}}]
execute if score #error_code tpa.variables matches 5 run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.home_create", "color":"red"}]
