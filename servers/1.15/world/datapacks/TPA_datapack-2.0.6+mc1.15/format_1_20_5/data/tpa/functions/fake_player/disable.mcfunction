# Parent function: tpa:options
scoreboard players set #carpet_installed tpa.variables 0
function tpa:fake_player/carpet
execute if score #carpet_installed tpa.variables matches 1 run scoreboard players set #carpet_fake_player_fix tpa.config 1
execute if score #carpet_installed tpa.variables matches 1 run return 0
scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
tellraw @a [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, {"storage": "tpa:tpa", "nbt": "temp.lang.option_carpet_disabled"}]
scoreboard players set #carpet_fake_player_fix tpa.config 0