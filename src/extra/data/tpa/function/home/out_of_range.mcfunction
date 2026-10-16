# Parent function: tpa:home
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_out_of_range
execute store result storage tpa:tpa temp.output.arg int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa temp.output.arg
function tpa:output/one_arg
