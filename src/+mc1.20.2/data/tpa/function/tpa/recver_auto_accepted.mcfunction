# Parent function: tpa:tpa/request_not_existed

execute as @p[tag=to_modify] run function tpa:back/set
tp @p[tag=to_modify] @s

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.reqer_accept_auto
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.reqer_accept_auto_hoverevent
function tpa:output/one_arg

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.recver_accept_auto
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_accept_auto_hoverevent
execute as @p[tag=to_modify] run function tpa:output/one_arg
