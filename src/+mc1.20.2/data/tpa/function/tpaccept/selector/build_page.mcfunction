# Parent function: tpa:tpaccept/show_selector, tpa:tpaccept/update_menu

# start = page*5 - 4
execute store result score #selector.page tpa.variables run data get storage tpa:tpa temp.matched_selector.page
scoreboard players operation #selector.start_index tpa.variables = #selector.page tpa.variables
scoreboard players operation #selector.start_index tpa.variables *= #5 tpa.variables
scoreboard players remove #selector.start_index tpa.variables 4
execute store result storage tpa:tpa temp.output.start_index int 1 run scoreboard players get #selector.start_index tpa.variables

# end = page*5
scoreboard players operation #selector.end_index tpa.variables = #selector.page tpa.variables
scoreboard players operation #selector.end_index tpa.variables *= #5 tpa.variables
execute if score #selector.end_index tpa.variables > #selector.total_requests tpa.variables run scoreboard players operation #selector.end_index tpa.variables = #selector.total_requests tpa.variables
execute store result storage tpa:tpa temp.output.end_index int 1 run scoreboard players get #selector.end_index tpa.variables

scoreboard players set #selector.index tpa.variables 1
data modify storage tpa:tpa temp.selector.requests set from storage tpa:tpa temp.matched_selector.requests
data modify storage tpa:tpa temp.output.requests set value []
data modify storage tpa:tpa temp.output.teleporters set value []
data modify storage tpa:tpa temp.output.destinations set value []
execute if data storage tpa:tpa temp.selector.requests[0] run function tpa:tpaccept/selector/request/loop
