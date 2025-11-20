scoreboard players set @s tpa.search_id 0
function tpa:load_lang
function tpa:sounds/no
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.search_id_disabled"}, ". "]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.search_id_disabled", "color":"red"}]