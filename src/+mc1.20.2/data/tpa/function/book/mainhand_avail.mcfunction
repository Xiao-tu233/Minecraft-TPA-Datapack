# Parent function: tpa:book/available

# Clear before giving
clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]

# Prepare for the book content editting

    # Calc Book Arguments
    execute store result score #total_lines tpa.variables if entity @a[predicate=tpa:available]
    scoreboard players operation #max_page tpa.variables = #total_lines tpa.variables
    scoreboard players operation #max_page tpa.variables /= #14 tpa.variables
    scoreboard players operation #lines_of_last_page tpa.variables = #total_lines tpa.variables
    scoreboard players operation #lines_of_last_page tpa.variables %= #14 tpa.variables
    scoreboard players set #pages tpa.variables 0
    scoreboard players set #i tpa.variables 0

    data modify storage tpa:tpa temp.book.pages set value []
    # Structing book pages:
    # [{raw: <page_content: text_component>}, ...]
    function tpa:book/each_page

    # Modify book cover as macro arguments
    data remove storage tpa:tpa temp.args
    data modify storage tpa:tpa temp.args.pages set from storage tpa:tpa temp.book.pages
    data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value {interpret: true, storage:"tpa:tpa",nbt:"loaded_lang.book_title"}
    data modify storage tpa:tpa temp.args.title set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text
    data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value {interpret: true, storage:"tpa:tpa",nbt:"loaded_lang.book_lore"}
    data modify storage tpa:tpa temp.args.lore set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text

    function tpa:book/give with storage tpa:tpa temp.args