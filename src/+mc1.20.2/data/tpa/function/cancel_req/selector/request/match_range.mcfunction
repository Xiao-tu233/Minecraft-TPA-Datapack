data modify storage tpa:tpa temp.output.requests append from storage tpa:tpa temp.selector.requests[0]
execute store result score #selector.direction tpa.variables run data get storage tpa:tpa temp.selector.requests[0].direction
execute store result score #selector.recver tpa.variables run data get storage tpa:tpa temp.selector.requests[0].recver
execute as @a if score @s tpa.uid = #selector.recver tpa.variables run function tpa:get_name
execute if score #selector.direction tpa.variables matches 0 run data modify storage tpa:tpa temp.output.teleporters append from storage tpa:tpa loaded_lang.reqer_cancel_selector_you_placeholder
execute if score #selector.direction tpa.variables matches 0 run data modify storage tpa:tpa temp.output.destinations append from storage tpa:tpa temp.name
execute if score #selector.direction tpa.variables matches 1 run data modify storage tpa:tpa temp.output.teleporters append from storage tpa:tpa temp.name
execute if score #selector.direction tpa.variables matches 1 run data modify storage tpa:tpa temp.output.destinations append from storage tpa:tpa loaded_lang.reqer_cancel_selector_you_placeholder
