# Parent function: tpa:tpa/request_not_existed
scoreboard players operation #reqer tpa.variables = @s tpa.uid
# recver has been set
scoreboard players operation #direction tpa.variables = #checking_direction tpa.variables
function tpa:requests/add

function tpa:sounds/pick_orb
execute as @p[tag=to_modify] run function tpa:sounds/pick_orb

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.chatbar.langs set from storage tpa:tpa loaded_lang.reqer_req_tpahere
data modify storage tpa:tpa temp.output.actionbar.langs set from storage tpa:tpa loaded_lang.reqer_req_tpahere
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_accept_tpahere_hoverevent
data modify storage tpa:tpa temp.output.button set from storage tpa:tpa loaded_lang.reqer_req_button_cancel
data modify storage tpa:tpa temp.output.button_hover set from storage tpa:tpa loaded_lang.reqer_req_button_cancel_hoverevent
function tpa:output/request/reqer

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.chatbar.langs set from storage tpa:tpa loaded_lang.recver_recv_tpahere_chatbar
data modify storage tpa:tpa temp.output.actionbar.langs set from storage tpa:tpa loaded_lang.recver_recv_tpahere_actionbar
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_recv_tpahere_hoverevent
data modify storage tpa:tpa temp.output.buttons set value []
data modify storage tpa:tpa temp.output.buttons_hover set value []
data modify storage tpa:tpa temp.output.buttons append from storage tpa:tpa loaded_lang.recver_recv_button_accept
data modify storage tpa:tpa temp.output.buttons_hover append from storage tpa:tpa loaded_lang.recver_recv_button_accept_hoverevent
data modify storage tpa:tpa temp.output.buttons append from storage tpa:tpa loaded_lang.recver_recv_button_deny
data modify storage tpa:tpa temp.output.buttons_hover append from storage tpa:tpa loaded_lang.recver_recv_button_deny_hoverevent
execute as @p[tag=to_modify] run function tpa:output/request/recver