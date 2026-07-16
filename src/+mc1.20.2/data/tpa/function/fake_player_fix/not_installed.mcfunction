scoreboard players set #carpet_fake_player_fix tpa.config 0
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.option_carpet_disabled"}]
