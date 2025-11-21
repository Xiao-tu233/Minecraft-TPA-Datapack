# Called by: (Player) Any Operator, quoted by tpa:options_advenced
# Full Name: calculate_simulate_distance
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.teleport_incompatible"}]