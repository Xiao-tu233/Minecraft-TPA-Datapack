function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.output=4}] \
    run tellraw @s [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.output_default"}, ". "]
execute as @s[scores={tpa.output=4}] \
    run title @s actionbar [{storage:"tpa:tpa", nbt:"temp.lang.output_default", color:"gold"}]
execute as @s[scores={tpa.output=3}] \
    run title @s actionbar [{storage:"tpa:tpa", nbt:"temp.lang.output_hide_chatbar", color:"gold"}]
execute as @s[scores={tpa.output=5}] \
    run tellraw @s [{storage:"tpa:tpa", nbt:"temp.lang.header"}, {storage:"tpa:tpa", nbt:"temp.lang.output_hide_actionbar"}, ". "]
scoreboard players remove @s tpa.output 3
