# Parent function: tpa:tick, tpa:home/set, tpa:home/remove

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

function tpa:dimension/refresh

function tpa:sounds/levelup
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_menu_title"}]

data remove storage tpa:tpa temp.home_result
data modify storage tpa:tpa temp.home_result set value {}
scoreboard players set #home.match_all tpa.variables 1
scoreboard players set #home.store_result tpa.variables 1
scoreboard players set #home.remove_current tpa.variables 0
scoreboard players set #home.replace_current tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_result
data remove storage tpa:tpa temp.home_result
execute store result score #home_owns tpa.variables run data get storage tpa:tpa temp.home

execute if score #home_owns tpa.variables matches 0 run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_create"}, \
        {\
            interpret: true, \
            storage:"tpa:tpa", \
            nbt:"loaded_lang.home_create_button", \
            click_event:{action:"run_command",command: "/trigger tpa.sethome"}, \
            hover_event: {action: "show_text", value: {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_create_button_hoverevent"}}\
        }\
    ]
execute if score #home_owns tpa.variables matches 1.. run function tpa:home/menu_display
