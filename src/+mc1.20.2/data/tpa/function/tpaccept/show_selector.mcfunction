# Parent function: tpa:tpaccept/found_multiple

data remove storage tpa:tpa temp.output
execute store result score #selector.page tpa.variables run data get storage tpa:tpa temp.matched_selector.page
execute store result storage tpa:tpa temp.output.current_page int 1 run scoreboard players get #selector.page tpa.variables
data modify storage tpa:tpa temp.output.current_page set string storage tpa:tpa temp.output.current_page
scoreboard players remove #selector.page tpa.variables 1
execute store result storage tpa:tpa temp.output.previous_page int 1 run scoreboard players get #selector.page tpa.variables
data modify storage tpa:tpa temp.output.previous_page set string storage tpa:tpa temp.output.previous_page
scoreboard players add #selector.page tpa.variables 2
execute store result storage tpa:tpa temp.output.next_page int 1 run scoreboard players get #selector.page tpa.variables
data modify storage tpa:tpa temp.output.next_page set string storage tpa:tpa temp.output.next_page

execute store result storage tpa:tpa temp.output.total_requests int 1 run scoreboard players get #selector.total_requests tpa.variables
data modify storage tpa:tpa temp.output.total_requests set string storage tpa:tpa temp.output.total_requests
execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #selector.total_pages tpa.variables
data modify storage tpa:tpa temp.output.total_pages set string storage tpa:tpa temp.output.total_pages

function tpa:tpaccept/selector/build_page

function tpa:output/recv_selector
