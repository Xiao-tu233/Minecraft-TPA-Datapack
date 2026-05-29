# Parent function: tpa:book/is_missing_or_stacking

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §r", {selector:"@s"}, " is detected to have stacking TPA books."]
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.book_stacking"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.book_stacking", color:"red"}]
function tpa:book