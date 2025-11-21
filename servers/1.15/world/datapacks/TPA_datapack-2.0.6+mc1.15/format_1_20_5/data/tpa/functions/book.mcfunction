scoreboard players set @s tpa.book 0


function tpa:load_lang
scoreboard players set #error_code tpa.variables 0
execute if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #book tpa.config matches 1 if entity @s run scoreboard players set #error_code tpa.variables 2
execute if data entity @s SelectedItem run scoreboard players set #error_code tpa.variables 3

execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.book_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.book_spec", "color":"red"}]
execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.book_disabled"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.book_disabled", "color":"red"}]
execute if score #error_code tpa.variables matches 3 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.book_mainhand_busy"}, ". "]
execute if score #error_code tpa.variables matches 3 \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.book_mainhand_busy", "color":"red"}]
execute if score #error_code tpa.variables matches 1..3 run return 0


clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]
# For 1.20.2-1.20.4:
# item replace entity @s[scores={tpa.mainhand_unavailable=0}] weapon.mainhand with \
# minecraft:written_book{isTpaBook:1b,display:{Name:'"§r§b传送菜单书"',Lore:['"§r§b右键打开TPA菜单."']}}

# Prepare for the book content editting
summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}

execute store result score #pages tpa.variables if entity @a[scores={tpa.player_id=2..}]
scoreboard players operation #pages tpa.variables /= #14 tpa.variables
scoreboard players set #pages_current tpa.variables 0
scoreboard players set #i tpa.variables 0
data modify storage tpa:tpa book.pages set value '""'
function tpa:book/each_page
data remove storage tpa:tpa book.arg
data modify storage tpa:tpa book.pages set string storage tpa:tpa book.pages 3

data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"temp.lang.book_title"}'
data modify storage tpa:tpa book.title set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value '{"storage":"tpa:tpa","nbt":"temp.lang.book_lore"}'
data modify storage tpa:tpa book.lore set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text

function tpa:book/give with storage tpa:tpa book

kill @n[type=text_display, tag=tpa.text_display]
# This is not necessary, but I prefer cuz I don't wanna see a mess in my storage
execute if score #debug_mode tpa.config matches 0 run data remove storage tpa:tpa book

