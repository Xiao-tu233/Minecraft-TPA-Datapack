# Usage: /trigger tpa.output add 6
execute if score @s tpa.output matches 6 run scoreboard players set @s tpa.output 4
execute if score @s tpa.output matches 7 run scoreboard players set @s tpa.output 5
execute if score @s tpa.output matches 8 run scoreboard players set @s tpa.output 3

function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.output=3}] \
    run tellraw @s [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.output_default"}, ". "]
execute as @s[scores={tpa.output=3}] \
    run title @s actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.output_default", color:"gold"}]
execute as @s[scores={tpa.output=4}] \
    run title @s actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.output_hide_chatbar", color:"gold"}]
execute as @s[scores={tpa.output=5}] \
    run tellraw @s [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.output_hide_actionbar"}, ". "]
scoreboard players remove @s tpa.output 3
