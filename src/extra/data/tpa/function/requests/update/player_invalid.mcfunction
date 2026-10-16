# Parent function: tpa:requests/update/remove

execute if score #debug_mode tpa.config matches 1 run tellraw @a {translate: "[§bTPA§r] §6 Debug: §rRequest_%1$s from %2$s to %3$s removed due to PLAYER INVALIDITY", with: [{score: {name: "#direction", objective: "tpa.variables"}}, {score: {name: "#requests.current_reqer", objective: "tpa.variables"}}, {score: {name: "#requests.current_recver", objective: "tpa.variables"}}]}

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.reqer_req_invalid
execute as @p[tag=recver] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.reqer_req_invalid_hoverevent
execute as @p[tag=reqer] run function tpa:output/one_arg

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.recver_req_invalid
execute as @p[tag=reqer] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_req_invalid_hoverevent
execute as @p[tag=recver] run function tpa:output/one_arg