# tpa.book States: 0 - Not triggered, 1 - Requested, 2 - Given book, 3 - Triggered with Given book, -1 - Book Missing(Not Using currently)

function tpa:load_lang

scoreboard players set @s tpa.book 0

function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.book_incompatible"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.book_incompatible", "color":"red"}]

clear @s minecraft:written_book{isTpaBook:1b}