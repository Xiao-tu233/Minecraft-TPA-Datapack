scoreboard players set @s tpa.book 0

function tpa:load_lang
scoreboard players set #error_code tpa.variables 0
execute if entity @s[gamemode=spectator] run scoreboard players set #error_code tpa.variables 1
execute if score #book tpa.config matches 1 if entity @s run scoreboard players set #error_code tpa.variables 2
execute if data entity @s SelectedItem run scoreboard players set #error_code tpa.variables 3

execute if score #error_code tpa.variables matches 1..3 run function tpa:sounds/no
execute if score #error_code tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.book_spec"}, ". "]
execute if score #error_code tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.book_spec", color:"red"}]
execute if score #error_code tpa.variables matches 2 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.book_disabled"}, ". "]
execute if score #error_code tpa.variables matches 2 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.book_disabled", color:"red"}]
execute if score #error_code tpa.variables matches 3 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.book_mainhand_busy"}, ". "]
execute if score #error_code tpa.variables matches 3 \
    run title @s[scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.book_mainhand_busy", color:"red"}]
execute if score #error_code tpa.variables matches 1..3 run return 0


clear @s minecraft:written_book[minecraft:custom_data={isTpaBook:1b}]

summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}

data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.title set from storage tpa:tpa temp.lang.book_title
data modify storage tpa:tpa temp.args.lore set from storage tpa:tpa temp.lang.book_lore


function tpa:book/give with storage tpa:tpa temp.args

# Player's upper limit and iter value
scoreboard players set #j tpa.variables 0
execute store result score #avail_players tpa.variables if entity @a[scores={tpa.player_id=2..}]

# id iters from 2 to #global_current-1 
scoreboard players set #i tpa.variables 2

function tpa:book/each_page

kill @n[type=text_display, tag=tpa.text_display]