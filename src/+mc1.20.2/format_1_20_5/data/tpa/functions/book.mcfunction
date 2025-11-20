# tpa.book States: 0 - Not triggered, 1 - Requested, 2 - Given book, 3 - Triggered with Given book, -1 - Book Missing(Not Using currently)

function tpa:load_lang
scoreboard players set #error_code tpa.variables 0
execute if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #book tpa.config matches 1 if entity @s run scoreboard players set #error_code tpa.variables 2
execute if data entity @s SelectedItem run scoreboard players set #error_code tpa.variables 3

scoreboard players set @s tpa.book 0

execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.book_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.book_spec", "color":"red"}]
execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.book_disabled"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.book_disabled", "color":"red"}]
execute if score #error_code tpa.variables matches 3 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.book_mainhand_busy"}, " ", {"storage": "tpa:tpa", "nbt": "loaded_lang.book_reget", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.book_reget_hoverevent"} }, "clickEvent": {"action": "run_command", "value": "/trigger tpa.book" }}]
execute if score #error_code tpa.variables matches 3 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.book_mainhand_busy", "color":"red"}]
execute if score #error_code tpa.variables matches 1..3 run return 0

clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]

# Prepare for the book content editting
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}

    # Calc Book Content
    execute store result score #pages tpa.variables if entity @a[scores={tpa.player_id=2..}]
    scoreboard players operation #pages tpa.variables /= #14 tpa.variables
    scoreboard players set #pages_current tpa.variables 0
    scoreboard players set #i tpa.variables 0
    data modify storage tpa:tpa book.pages set value '""'
    function tpa:book/each_page
    data remove storage tpa:tpa book.arg
    data modify storage tpa:tpa book.pages set string storage tpa:tpa book.pages 3

    # Modify book cover as macro arguments
    data modify entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"loaded_lang.book_title"}'
    data modify storage tpa:tpa book.title set from entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text
    data modify entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"loaded_lang.book_lore"}'
    data modify storage tpa:tpa book.lore set from entity @e[sort=nearest, limit=1, type=minecraft:text_display,tag=tpa.text_display] text
    function tpa:book/give with storage tpa:tpa book

kill @e[sort=nearest, limit=1, type=text_display, tag=tpa.text_display]