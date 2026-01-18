scoreboard players set @s tpa.search_id 0
function tpa:load_lang
execute if score #search_id tpa.variables matches 1 run function tpa:sounds/no
execute if score #search_id tpa.config matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_incompatible"}, ". " ]
execute if score #search_id tpa.config matches 1 run title @s[predicate=tpa:output/show_chatbar] actionbar [{"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_incompatible"}]
execute if score #search_id tpa.config matches 1 run return 0
