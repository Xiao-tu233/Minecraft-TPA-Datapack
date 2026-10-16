# Parent function: tpa:home/has_home

function tpa:back/set
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
function tpa:home/act_macro with storage tpa:tpa temp.args

function tpa:sounds/tp
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_act
execute store result storage tpa:tpa temp.output.arg int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.arg_hover set value ""
function tpa:output/one_arg
