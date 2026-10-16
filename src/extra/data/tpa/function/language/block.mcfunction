# Parent function: tpa:language
scoreboard players operation @s tpa.selected_language = #language tpa.config
function tpa:load_lang

# Output
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.lang_disabled
function tpa:output/standard