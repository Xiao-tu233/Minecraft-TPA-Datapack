#! Originally named tpa:tpamenu
# Parent Function tpa:tick
function tpa:load_lang

scoreboard players set @s tpa.ext_menu 0

function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.extended_menu_incompatible"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.extended_menu_incompatible", "color":"red"}]
