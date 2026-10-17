# Parent function: tpa:removehome

function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part"}, ". " ]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_left_part", "color": "red"}, {"score":{"name": "#home", "objective": "tpa.variables"}, "color": "red", "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.home_not_found_right_part", "color": "red"} ]
