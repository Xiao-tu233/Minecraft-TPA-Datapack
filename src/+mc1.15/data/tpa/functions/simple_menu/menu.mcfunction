# Parent function: tpa:simple_menu, tpa:tpa

scoreboard players set #is_menu_open tpa.variables 1
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_incompatible"}] 
title @s[predicate=tpa:output/show_actionbar] actionbar [ {"storage":"tpa:tpa", "nbt":"loaded_lang.simple_menu_incompatible", "color":"red"}] 
