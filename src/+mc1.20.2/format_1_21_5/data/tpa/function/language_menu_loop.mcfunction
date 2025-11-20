execute if data storage tpa:tpa loaded_language[0] unless score #is_server_selecting tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage: "tpa:tpa", nbt: "loaded_language[0].id"}, ": ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_language[0].name_display", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_language[0].name"}}\
    } \
]
execute if data storage tpa:tpa loaded_language[0] if score #is_server_selecting tpa.variables matches 1 \
    run tellraw @s [\
    {storage: "tpa:tpa", nbt: "loaded_language[0].id"}, ": ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_language[0].name_display", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_language[0].name"}}\
    } \
]
data remove storage tpa:tpa loaded_language[0]

scoreboard players add #i tpa.variables 1

execute if score #i tpa.variables >= #langs_installed tpa.variables run return 0

function tpa:language_menu_loop