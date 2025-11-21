scoreboard players set @s tpa.book 0
function tpa:load_lang
function tpa:sounds/no
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.book_disabled"}, ". "]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.book_disabled", "color":"red"}]