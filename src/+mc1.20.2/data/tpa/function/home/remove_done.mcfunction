# Parent function: tpa:home/removehome_remove

function tpa:sounds/click
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_remove
execute store result storage tpa:tpa temp.output.arg int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.home_remove_hoverevent
function tpa:output/one_arg
