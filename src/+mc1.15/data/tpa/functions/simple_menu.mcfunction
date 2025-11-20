
scoreboard players set @s tpa.simple_menu 0

function tpa:load_lang
function tpa:sounds/no
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.simple_menu_disabled"}, ". "]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.simple_menu_disabled", "color":"red"}]