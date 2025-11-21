execute store result score #lang_id tpa.variables run data get storage tpa:tpa temp.lang[0].id
execute if score #lang_id tpa.variables = #target_lang tpa.variables \
    run data modify storage tpa:tpa temp.lang set from storage tpa:tpa temp.lang[0]
execute if score #lang_id tpa.variables = #target_lang tpa.variables run return 0
execute unless score #lang_id tpa.variables = #target_lang tpa.variables \
    run data remove storage tpa:tpa temp.lang[0]

scoreboard players add #langs_checked tpa.variables 1
execute if score #langs_checked tpa.variables = #langs_installed tpa.variables run return 0
function tpa:check_lang