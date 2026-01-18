# Called by: (player) Any OP, Quoted by: tpa:options.carpet_fake_player_fix.enable_clickEvent

scoreboard players set #carpet_fake_player_fix tpa.config 0
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.option_carpet_fake_player_fix_incompatible"}]