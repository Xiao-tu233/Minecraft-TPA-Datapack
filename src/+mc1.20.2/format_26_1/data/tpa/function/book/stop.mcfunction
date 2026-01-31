# Parent Function: tpa:tick
scoreboard players set @s tpa.book 0
clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]
function tpa:load_lang
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.book_stop"}, \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.book_reget", \
        hover_event: {\
            action: "show_text", \
            value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.book_reget_hoverevent"} \
        }, \
        click_event: {\
            action: "run_command", \
            command: "/trigger tpa.book" \
        }\
    } \
]
title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.book_stop"}]