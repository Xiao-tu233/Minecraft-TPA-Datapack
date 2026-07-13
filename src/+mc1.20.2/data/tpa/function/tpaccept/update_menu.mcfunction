# Parent function: tpa:tpaccept/found_multiple

data modify storage tpa:tpa temp.current_selector set from storage tpa:tpa temp.matched_selector

execute if score #accept_index tpa.variables matches 1 run function tpa:tpaccept/pass
execute if score #accept_index tpa.variables matches 2 run function tpa:tpaccept/previous_page
execute if score #accept_index tpa.variables matches 3..7 run function tpa:tpaccept/selector/build_page
execute if score #accept_index tpa.variables matches 3..7 run function tpa:tpaccept/accept_specific
execute if score #accept_index tpa.variables matches 8 run function tpa:tpaccept/next_page

scoreboard players operation #recver tpa.variables = @s tpa.uid
scoreboard players reset #reqer tpa.variables
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
function tpa:tpaccept/selector/set

function tpa:tpaccept/selector/get
