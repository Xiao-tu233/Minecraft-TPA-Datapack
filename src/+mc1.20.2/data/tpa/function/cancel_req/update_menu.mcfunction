# Parent function: tpa:cancel_req/multiple_found

data modify storage tpa:tpa temp.current_selector set from storage tpa:tpa temp.matched_selector

execute if score #cancel_index tpa.variables matches 1 run function tpa:cancel_req/pass
execute if score #cancel_index tpa.variables matches 2 run function tpa:cancel_req/previous_page
execute if score #cancel_index tpa.variables matches 3..7 run function tpa:cancel_req/selector/build_page
execute if score #cancel_index tpa.variables matches 3..7 run function tpa:cancel_req/cancel_specific
execute if score #cancel_index tpa.variables matches 8 run function tpa:cancel_req/next_page

scoreboard players operation #reqer tpa.variables = @s tpa.uid
scoreboard players reset #recver tpa.variables
scoreboard players reset #direction tpa.variables
function tpa:requests/get

execute store result score #selector.total_requests tpa.variables run data get storage tpa:tpa temp.matched_requests
scoreboard players operation #selector.total_pages tpa.variables = #selector.total_requests tpa.variables
scoreboard players remove #selector.total_pages tpa.variables 1
scoreboard players operation #selector.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #selector.total_pages tpa.variables 1
execute store result score #selector.current_page tpa.variables run data get storage tpa:tpa temp.current_selector.page
execute if score #selector.current_page tpa.variables > #selector.total_pages tpa.variables run scoreboard players operation #selector.current_page tpa.variables = #selector.total_pages tpa.variables
execute store result storage tpa:tpa temp.current_selector.page int 1 run scoreboard players get #selector.current_page tpa.variables

execute store result storage tpa:tpa temp.current_selector.uid int 1 run scoreboard players get #uid tpa.variables
data modify storage tpa:tpa temp.current_selector.requests set from storage tpa:tpa temp.matched_requests
function tpa:cancel_req/selector/set

function tpa:cancel_req/selector/get
