
# Usage: /trigger tpa.tpaccept_toggle add 4
execute if score @s tpa.mute matches 4 run scoreboard players set @s tpa.mute 3
execute if score @s tpa.mute matches 5 run scoreboard players set @s tpa.mute 2

# 1: mute(Feature enabled) 0: unmute(feature disabled)
function tpa:load_lang
execute as @s[scores={tpa.mute=2}] \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.mute_disable"}, ". "]
execute as @s[scores={tpa.mute=2}] \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.mute_disable", "color":"gold"}]
execute as @s[scores={tpa.mute=3}] \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.mute_enable"}, ". "]
execute as @s[scores={tpa.mute=3}] \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.mute_enable", "color":"gold"}]
scoreboard players remove @s tpa.mute 2
function tpa:sounds/click
