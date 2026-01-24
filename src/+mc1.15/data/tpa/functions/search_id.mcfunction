scoreboard players set @s tpa.search_id 0
function tpa:load_lang
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_incompatible"}, ". " ]
title @s[predicate=tpa:output/show_chatbar] actionbar [{"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_incompatible"}]