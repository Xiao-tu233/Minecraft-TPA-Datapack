# Called by: (Player) Any Operator, quoted by tpa:options_advenced
# Full Name: calculate_simulate_distance
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.teleport_incompatible"}]