# Parent function: tpa:tpa/request_not_existed
scoreboard players operation #reqer tpa.variables = @s tpa.uid
# recver has been set
scoreboard players set #direction tpa.variables 0
function tpa:requests/add

function tpa:sounds/pick_orb

data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.reqer_req_tpa
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_accept_tpa_hoverevent
function tpa:output/one_arg

data modify storage tpa:tpa temp.output.chatbar.langs set from storage tpa:tpa loaded_lang.recver_recv_tpa_chatbar
data modify storage tpa:tpa temp.output.actionbar.langs set from storage tpa:tpa loaded_lang.recver_recv_tpa_actionbar
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_recv_tpa_hoverevent
execute as @p[tag=to_modify] run function tpa:output/seperated/one_arg