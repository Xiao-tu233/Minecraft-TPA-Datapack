execute store result score #recver tpa.variables run data get storage tpa:tpa temp.matched_requests[0].recver
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.matched_requests[0].direction
tag @a remove to_modify
execute as @a if score #recver tpa.variables = @s tpa.uid run tag @s add to_modify

function tpa:requests/pop

function tpa:sounds/click

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.reqer_cancel
execute as @p[tag=to_modify] run function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.reqer_cancel_hoverevent
function tpa:output/one_arg

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.recver_cancel
function tpa:get_name
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa loaded_lang.recver_cancel_hoverevent
execute as @p[tag=to_modify] run function tpa:output/one_arg