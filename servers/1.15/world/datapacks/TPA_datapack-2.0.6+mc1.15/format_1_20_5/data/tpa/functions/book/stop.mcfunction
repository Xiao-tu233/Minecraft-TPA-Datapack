# Parent Function: tpa:tick
clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]
function tpa:load_lang
function tpa:sounds/click
tellraw @s[scores={tpa.output=1..2}] [\
    {"storage": "tpa:tpa", "nbt": "temp.lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "temp.lang.book_stop"}, \
    "." \
]
title @s[scores={tpa.output=0..1}] actionbar [{"storage": "tpa:tpa", "nbt": "temp.lang.book_stop"}]