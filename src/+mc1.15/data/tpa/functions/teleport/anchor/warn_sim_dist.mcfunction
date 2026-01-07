# Parent function: tpa:teleport/main

function tpa:load_lang
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_sim_dist_disabled"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_sim_dist_disabled", "color":"red"}]


scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_sim_dist_warn"}, " ", {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_sim_dist_warn_button_calc", "clickEvent":{"action":"run_command","value":"/function tpa:teleport/cal_sim_dist"}, "hoverEvent":{"action": "show_text", "value": {"storage":"tpa:tpa","nbt":"loaded_lang.teleport_sim_dist_warn_button_calc_hoverevent"}}}, " ", {"storage":"tpa:tpa", "nbt":"loaded_lang.teleport_sim_dist_warn_button_binary", "clickEvent":{"action":"run_command","value":"/scoreboard players set #uses_binary_teleport tpa.config 1"}, "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa","nbt":"loaded_lang.teleport_sim_dist_warn_button_binary_hoverevent"}}}]