# make lang copy
data remove storage tpa:tpa temp.lang
data modify storage tpa:tpa temp.lang set from storage tpa:tpa lang

# Check if function is called by a player or the server: #target_lang is None
execute unless score #target_lang tpa.variables = #target_lang tpa.variables run scoreboard players operation #target_lang tpa.variables = @s tpa.lang_temp

# Skip load lang if lang has been loaded to temp
execute store result score #lang_temp tpa.variables run data get storage tpa:tpa temp.lang.id
execute unless data storage tpa:tpa temp.lang.id run scoreboard players reset #lang_temp tpa.variables
scoreboard players set #has_lang_loaded tpa.variables 0
execute if score #lang_temp tpa.variables = #target_lang tpa.variables run scoreboard players set #has_lang_loaded tpa.variables 1

# Init enum vars
scoreboard players set #langs_checked tpa.variables 0
execute store result score #langs_installed tpa.variables run data get storage tpa:tpa temp.lang

# Call loop function
execute if score #has_lang_loaded tpa.variables matches 0 run function tpa:check_lang

# Fallback to default lang: lang[1] if selected lang is not loaded properly
scoreboard players set #is_lang_loaded tpa.variables 1
execute unless data storage tpa:tpa temp.lang.id run scoreboard players set #is_lang_loaded tpa.variables 0
execute if score #is_lang_loaded tpa.variables matches 0 run data modify storage tpa:tpa temp.lang set from storage tpa:tpa lang[1]
execute if score #is_lang_loaded tpa.variables matches 0 run data modify storage tpa:tpa temp.lang.id set value 0
execute if score #is_lang_loaded tpa.variables matches 0 run data modify storage tpa:tpa temp.lang.name_display set value "Default"

# #target_lang = None
scoreboard players reset #target_lang tpa.variables