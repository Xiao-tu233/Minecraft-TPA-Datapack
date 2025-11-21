# simple_menu == 3: trigger disable
# simple_menu == 2: trigger enable
# simple_menu == 1: show simple menu when /trigger tpa
# simple_menu == 0: show tpa menu when /trigger tpa

function tpa:load_lang
function tpa:sounds/click

tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_toggle=3}] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_disable"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_toggle=3}] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_disable", "color": "gold"}]
execute as @s[scores={tpa.simple_menu=3}] run function tpa:tpa_menu
execute as @s[scores={tpa.simple_menu=3}] run scoreboard players set @s tpa.simple_menu 0

tellraw @s[predicate=tpa:output/show_chatbar, scores={tpa.tpaccept_toggle=2}] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_enable"}]
title @s[predicate=tpa:output/show_actionbar, scores={tpa.tpaccept_toggle=2}] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_enable", "color": "gold"}]
execute as @s[scores={tpa.simple_menu=2}] run function tpa:simple_menu/menu
execute as @s[scores={tpa.simple_menu=2}] run scoreboard players set @s tpa.simple_menu 1
