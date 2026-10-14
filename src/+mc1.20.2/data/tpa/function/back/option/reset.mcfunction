# Called by: (Player) Any OP, quoted at: tpa:option

scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.back_option_reset
function tpa:output/anouncement

data modify storage tpa:tpa back set value []