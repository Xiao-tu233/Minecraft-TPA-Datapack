# Parent functino: tpa:load
function tpa:publish_date
data modify storage tpa:tpa temp.option.dates set value []
scoreboard players set #10 tpa.variables 10

# First slot
execute store result score #date_format tpa.variables run data get storage tpa:tpa loaded_lang.load_date_check_format
execute store result score #lang_id tpa.variables run data get storage tpa:tpa loaded_lang.id
scoreboard players operation #date_format tpa.variables /= #10 tpa.variables
scoreboard players operation #date_format tpa.variables /= #10 tpa.variables
function tpa:load_build_localized

# Second slot
execute store result score #date_format tpa.variables run data get storage tpa:tpa loaded_lang.load_date_check_format
execute store result score #lang_id tpa.variables run data get storage tpa:tpa loaded_lang.id
scoreboard players operation #date_format tpa.variables /= #10 tpa.variables
scoreboard players operation #date_format tpa.variables %= #10 tpa.variables
function tpa:load_build_localized

# Last slot
execute store result score #date_format tpa.variables run data get storage tpa:tpa loaded_lang.load_date_check_format
execute store result score #lang_id tpa.variables run data get storage tpa:tpa loaded_lang.id
scoreboard players operation #date_format tpa.variables %= #10 tpa.variables
function tpa:load_build_localized