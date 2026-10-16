# Parent function: tpa:tick, tpa:home/set, tpa:home/remove

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang

function tpa:dimension/refresh

function tpa:sounds/levelup
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_menu_title"}]

function tpa:get_name
function tpa:home/temp with storage tpa:tpa temp

execute unless data storage tpa:tpa temp.home run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_create"}, \
        {\
            interpret: true, \
            storage:"tpa:tpa", \
            nbt:"loaded_lang.home_create_button", \
            click_event:{action:"run_command",command: "/trigger tpa.sethome"}, \
            hover_event: {action: "show_text", value: {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.home_create_button_hoverevent"}}\
        }\
    ]
execute if data storage tpa:tpa temp.home run function tpa:home/menu_display
