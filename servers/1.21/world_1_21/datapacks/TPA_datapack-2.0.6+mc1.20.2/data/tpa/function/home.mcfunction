execute unless score @s tpa.home matches 0 run scoreboard players operation #home tpa.variables = @s tpa.home
execute unless score @s home matches 0 run scoreboard players operation #home tpa.variables = @s home
scoreboard players set @s tpa.home 0
scoreboard players set @s home 0

function tpa:load_lang

# Check if player's able to modify homes
function tpa:home/conditions
execute if score #error_code tpa.variables matches 1..2 run return 0

data remove storage tpa:tpa temp.home
data remove storage tpa:tpa temp.args

# Check if player is asking for menu
execute if score #home tpa.variables matches ..-1 run function tpa:home/menu
execute if score #home tpa.variables matches ..-1 run return 0

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{"score": {"name": "#home","objective": "tpa.variables"}}]

# Check if home is in range
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run function tpa:sounds/no
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_left_part"}, \
        {"score":{"name": "#home", "objective": "tpa.variables"}}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_right_part"}, ". " \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [ \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_left_part", "color": "red"}, \
        {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red"}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_out_of_range_right_part", "color": "red"} \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run return 0

# The storage structure of tpa:tpa home is:
# home: {
#     <id1>: {
#         1: {x: int, y: int, z: int, dim: string[Dimension]}, 
#         2:{x,y,z,dim}, 
#         ...more homes
#     }, 
#     <id2>: {
#         1:{x,y,z,dim}, 
#         2:{x,y,z,dim}, 
#         ...more homes
#     }, 
#     ...more ids
# }

function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
scoreboard players set #has_home tpa.variables 0
execute store result score #has_home tpa.variables run function tpa:home/temp with storage tpa:tpa temp.args

# Tip the player if he hasn't had a home yet
execute if score #has_home tpa.variables matches 0 run function tpa:sounds/no
execute unless data storage tpa:tpa temp.home run tellraw @s[predicate=tpa:output/show_actionbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create"}, ". ", \
        {\
            "storage":"tpa:tpa", \
            "nbt":"loaded_lang.home_create_button", \
            "clickEvent": {"action": "run_command", "value": "/trigger tpa.sethome"}, \
            "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_create_button_hoverevent"}}\
        }\
    ]
execute unless data storage tpa:tpa temp.home run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_create", "color":"red"}]
execute unless data storage tpa:tpa temp.home run return 0

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
scoreboard players set #is_exist tpa.variables 0
execute store result score #is_exist tpa.variables run function tpa:home/is_exist with storage tpa:tpa temp.args

# If he has one, but the provided id is not valid, tell him home's not found.
execute if score #is_exist tpa.variables matches 0 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part"}, \
        {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part"}, ". " \
    ]
execute if score #is_exist tpa.variables matches 0 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part", "color": "red"}, \
        {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part", "color": "red"} \
    ]
execute if score #is_exist tpa.variables matches 0 run return 0

# Act home teleport
function tpa:back/set
function tpa:home/act_macro with storage tpa:tpa temp.args
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, \
    {"storage":"tpa:tpa", "nbt":"loaded_lang.home_act_left_part"}, \
    {"score":{"name": "#home", "objective": "tpa.variables"}}, \
    {"storage":"tpa:tpa", "nbt":"loaded_lang.home_act_right_part"}, ". " \
]

title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {"storage":"tpa:tpa", "nbt":"loaded_lang.home_act_left_part", "color": "gold"}, \
    {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "gold"}, \
    {"storage":"tpa:tpa", "nbt":"loaded_lang.home_act_right_part", "color": "gold"}\
]
