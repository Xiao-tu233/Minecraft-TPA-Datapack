# Parent Function: tpa:tick
scoreboard players set @s tpa.book 0
clear @s minecraft:written_book{isTpaBook:1b}
function tpa:load_lang
function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.book_stop"}, \
    {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.book_reget", \
        "hoverEvent": {\
            "action": "show_text", \
            "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.book_reget_hoverevent"} \
        }, \
        "clickEvent": {\
            "action": "run_command", \
            "value": "/trigger tpa.book" \
        }\
    } \
]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage": "tpa:tpa", "nbt": "loaded_lang.book_stop"}]