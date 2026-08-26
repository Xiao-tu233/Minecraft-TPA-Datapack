# Parent function: tpa:book/available

# \
""" \
The TPA Menu Book now contains 4 different parts: \
1. Feature buttons Page: (Page 0)\
   Contains player's current uid, \
   request menu page turning button \
   and feature buttons like back etc. \
2. Request menu (Page 1- Available Player Acount Devided by 7) \
3. Home menu (Right after Request Menu, Button in Page 0 and turn to here) \
4. Warp menu (Right after Home Menu, Button in Page 0 and turn to here) \
"""

# Clear before giving
clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]

# Get request menu
function tpa:request_menu/get_available_players

# Calculate request menu pages \
""" \
Each player now occupies two lines: \
one for the player name and one for the "Teleport" and "Teleport Here" buttons. \
Therefore, a 14-line book page can display up to 7 players instead of 14, \
while keeping long names readable. \
"""
execute store result score #book.total_players tpa.variables run data get storage tpa:tpa temp.request_menu.players
scoreboard players set #book.request_menu_pages tpa.variables 0
scoreboard players operation #book.request_menu_pages tpa.variables = #book.total_players tpa.variables
scoreboard players remove #book.request_menu_pages tpa.variables 1
scoreboard players operation #book.request_menu_pages tpa.variables /= #7 tpa.variables
scoreboard players add #book.request_menu_pages tpa.variables 1

# Calculate home menu pages
function tpa:test/pass

# Calculate warp menu pages
function tpa:test/pass

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