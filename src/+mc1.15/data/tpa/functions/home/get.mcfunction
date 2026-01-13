# Parent function: tpa:home

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{"score": {"name": "#home","objective": "tpa.variables"}}]

scoreboard players operation #uid tpa.variables = @s tpa.uid
scoreboard players set #op tpa.variables 0
function tpa:home/iterator/main

# #error_code == 4: player visited home which doesn't exist
execute if score #uid_found tpa.variables matches 1 if data storage tpa:tpa temp.home run scoreboard players set #error_code tpa.variables 4

# #error_code == 5: player has no home
execute if score #uid_found tpa.variables matches 0 run scoreboard players set #error_code tpa.variables 5

# If he has one, but the provided id is not valid, tell him home's not found.
execute if score #error_code tpa.variables matches 4 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 4 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part"}, ". " ]
execute if score #error_code tpa.variables matches 4 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part", "color": "red"} ]

# Tip the player if he hasn't had a home yet
execute if score #error_code tpa.variables matches 5 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 5 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create"}, ". ", {    "storage":"tpa:tpa", "nbt":"loaded_lang.home_create_button", "clickEvent": {"action": "run_command", "value": "/trigger tpa.sethome"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create_button_hoverevent"}}}]
execute if score #error_code tpa.variables matches 5 run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_create", "color":"red"}]
