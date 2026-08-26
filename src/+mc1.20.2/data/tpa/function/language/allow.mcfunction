# Parent function: tpa:language
scoreboard players operation @s tpa.selected_language = #language tpa.variables
function tpa:load_lang

# Make server follow language if not set
execute unless score #language tpa.config matches 1.. run function tpa:language/adopt_server

# Output
function tpa:sounds/levelup
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.lang_selected
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa loaded_lang.name_display
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.name
function tpa:output/one_arg