scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0

function tpa:load_lang

# Check if player's able to modify homes
function tpa:home/conditions
execute if score #error_code tpa.variables matches 1..2 run return 0

data remove storage tpa:tpa temp.home
data remove storage tpa:tpa temp.args

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rNow executing: §a#home: ",{score: {name: "#home",objective: "tpa.variables"}}]

# Check if home is in range
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run function tpa:sounds/no
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_out_of_range_left_part"}, \
        {score:{name: "#home", objective: "tpa.variables"}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_out_of_range_right_part"}, ". " \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [ \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_out_of_range_left_part", color: "red"}, \
        {score:{name: "#home", objective: "tpa.variables"}, color: "red"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_out_of_range_right_part", color: "red"} \
    ]
execute if score #home tpa.variables > #home tpa.config unless score #home tpa.config matches ..-1 run return 0

function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
scoreboard players set #has_home tpa.variables 0
execute store result score #has_home tpa.variables run function tpa:home/temp with storage tpa:tpa temp.args

# Tip the player if he hasn't had a home yet
execute if score #has_home tpa.variables matches 0 run function tpa:sounds/no
execute unless data storage tpa:tpa temp.home run tellraw @s[predicate=tpa:output/show_actionbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_create"}, ". ", \
        {\
            storage:"tpa:tpa", \
            nbt:"loaded_lang.home_create_button", \
            click_event:{action:"run_command",command: "/trigger tpa.sethome"}, \
            hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_create_button_hoverevent"}}\
        }\
    ]
execute unless data storage tpa:tpa temp.home run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.home_create", color:"red"}]
execute unless data storage tpa:tpa temp.home run return 0

execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
scoreboard players set #is_exist tpa.variables 0
execute store result score #is_exist tpa.variables run function tpa:home/is_exist with storage tpa:tpa temp.args

# If he has one, but the provided id is not valid, tell him home's not found.
execute if score #is_exist tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_exist tpa.variables matches 0 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_left_part"}, \
        {score:{name: "#home", objective: "tpa.variables"}, hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_right_part"}, ". " \
    ]
execute if score #is_exist tpa.variables matches 0 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_left_part", color: "red"}, \
        {score:{name: "#home", objective: "tpa.variables"}, color: "red", hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_not_found_right_part", color: "red"} \
    ]
execute if score #is_exist tpa.variables matches 0 run return 0

# Because empty NBT compounds {} returns 1 when use execute store, 
# we need further check when removing home:
# remove the whole path if the length of home is 1
scoreboard players set #home_owns tpa.variables 0
execute store result score #home_owns tpa.variables run data get storage tpa:tpa temp.home

execute if score #home_owns tpa.variables matches 1 run function tpa:home/clear with storage tpa:tpa temp.args

# If length of home is 2.., compounds cannot be empty: remove the specific home with the given id
execute if score #home_owns tpa.variables matches 2.. run function tpa:home/remove with storage tpa:tpa temp.args

function tpa:home/menu
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_left_part"}, \
        {score:{name: "#home", objective: "tpa.variables"}, hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_right_part"}, ". " \
    ]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_left_part", color: "red"}, \
        {score:{name: "#home", objective: "tpa.variables"}, color: "red", hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.home_remove_right_part", color: "red"} \
    ]
