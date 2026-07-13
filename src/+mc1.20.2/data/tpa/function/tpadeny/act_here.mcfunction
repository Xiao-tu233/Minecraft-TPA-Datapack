data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.recver_deny_tpahere
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_deny_tpahere_hoverevent
function tpa:output/one_arg

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.reqer_deny_tpahere
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.reqer_deny_tpahere_hoverevent
execute as @p[tag=to_modify] run function tpa:output/one_arg