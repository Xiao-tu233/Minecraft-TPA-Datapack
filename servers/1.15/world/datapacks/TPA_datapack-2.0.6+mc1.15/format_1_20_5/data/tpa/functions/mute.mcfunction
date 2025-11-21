#! 1: mute 0: unmute
function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.mute=2}] \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.mute_disable"}, ". "]
execute as @s[scores={tpa.mute=2}] \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.mute_disable", "color":"gold"}]
execute as @s[scores={tpa.mute=3}] \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.mute_enable"}, ". "]
execute as @s[scores={tpa.mute=3}] \
    run title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.mute_enable", "color":"gold"}]
scoreboard players remove @s tpa.mute 2
