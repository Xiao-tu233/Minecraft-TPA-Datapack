#! 1: mute 0: unmute
function tpa:load_lang
function tpa:sounds/click
execute as @s[scores={tpa.mute=2}] \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.mute_disable"}, ". "]
execute as @s[scores={tpa.mute=2}] \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.mute_disable", "color":"gold"}]
execute as @s[scores={tpa.mute=3}] \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.mute_enable"}, ". "]
execute as @s[scores={tpa.mute=3}] \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.mute_enable", "color":"gold"}]
scoreboard players remove @s tpa.mute 2
