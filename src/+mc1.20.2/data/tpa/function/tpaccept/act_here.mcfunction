function tpa:back/set
tp @s @p[tag=to_modify]

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.loaded_lang.recver_accept_tpahere
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.loaded_lang.recver_accept_tpahere_hoverevent
function tpa:output/one_arg

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.loaded_lang.reqer_accept_tpahere
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.loaded_lang.reqer_accept_tpahere_hoverevent
execute as @p[tag=to_modify] run function tpa:output/one_arg