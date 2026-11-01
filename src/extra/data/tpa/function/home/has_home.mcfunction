# Parent function: tpa:home/check_selected

execute if score #home.trigger_state tpa.variables matches 2 run function tpa:home/remove
execute unless score #home.trigger_state tpa.variables matches 2 run function tpa:home/teleport

function tpa:sounds/tp
data remove storage tpa:tpa temp.output
execute if score #home.trigger_state tpa.variables matches 2 run data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_remove
execute unless score #home.trigger_state tpa.variables matches 2 run data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_act
execute store result storage tpa:tpa temp.output.arg int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.arg_hover set value ""

function tpa:output/one_arg
