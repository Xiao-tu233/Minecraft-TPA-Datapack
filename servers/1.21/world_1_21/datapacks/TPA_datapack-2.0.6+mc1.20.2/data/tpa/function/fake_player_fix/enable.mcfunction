# Called by: (player) Any OP, Quoted by: tpa:options.carpet_fake_player_fix.enable_clickEvent

scoreboard players set #is_carpet_installed tpa.variables 0
function tpa:fake_player_fix/is_carpet_installed {carpet: "carpet"}

execute if score #is_carpet_installed tpa.variables matches 1 run \
    scoreboard players set #carpet_fake_player_fix tpa.config 1
execute if score #is_carpet_installed tpa.variables matches 1 run \
    return 0

# if(!is_carpet_installed)
    scoreboard players set #carpet_fake_player_fix tpa.config 0
    scoreboard players operation #target_lang tpa.variables = #language tpa.config
    function tpa:load_lang
    tellraw @a [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.option_carpet_disabled"}]
