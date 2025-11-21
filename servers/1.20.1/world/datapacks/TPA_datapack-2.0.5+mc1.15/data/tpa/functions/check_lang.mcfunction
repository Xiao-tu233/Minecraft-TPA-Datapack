scoreboard players set #if_return tpa.variables 0

# Get current language's id
execute store result score #lang_id tpa.variables run data get storage tpa:tpa temp.lang[0].id
execute unless data storage tpa:tpa temp.lang[0].id run scoreboard players reset #lang_id tpa.variables

# Check if language is matching, if so, let lang = lang[0] and break
execute if score #lang_id tpa.variables = #target_lang tpa.variables run data modify storage tpa:tpa temp.lang set from storage tpa:tpa temp.lang[0]
execute if score #lang_id tpa.variables = #target_lang tpa.variables run scoreboard players set #if_return tpa.variables 1

# If language is not matching, remove the language from the list
execute unless score #if_return tpa.variables matches 1 unless score #lang_id tpa.variables = #target_lang tpa.variables run data remove storage tpa:tpa temp.lang[0]

# Check if all languages are checked, if so, break
execute unless score #if_return tpa.variables matches 1 run scoreboard players add #langs_checked tpa.variables 1
execute if score #langs_checked tpa.variables = #langs_installed tpa.variables run scoreboard players set #if_return tpa.variables 1

# Recuive call
execute unless score #if_return tpa.variables matches 1 run function tpa:check_lang