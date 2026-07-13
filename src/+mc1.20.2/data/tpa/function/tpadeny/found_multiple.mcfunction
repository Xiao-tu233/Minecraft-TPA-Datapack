# Parent function: tpa:tpadeny

scoreboard players set #selector_profile_created tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:tpaccept/selector/get
execute store result score #selector_profile_created tpa.variables run data get storage tpa:tpa temp.matched_selector

execute store result score #selector.total_requests tpa.variables run data get storage tpa:tpa temp.matched_requests
execute store result storage tpa:tpa temp.output.total_requests int 1 run scoreboard players get #selector.total_requests tpa.variables
data modify storage tpa:tpa temp.output.total_requests set string storage tpa:tpa temp.output.total_requests
scoreboard players operation #selector.total_pages tpa.variables = #selector.total_requests tpa.variables
scoreboard players remove #selector.total_pages tpa.variables 1
scoreboard players operation #selector.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #selector.total_pages tpa.variables 1
execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #selector.total_pages tpa.variables

execute if score #selector_profile_created tpa.variables matches 0 run function tpa:tpaccept/create_menu
data modify storage tpa:tpa temp.current_selector set from storage tpa:tpa temp.matched_selector

execute if score #deny_index tpa.variables matches -6..-2 run function tpa:tpaccept/selector/build_page
execute if score #deny_index tpa.variables matches -6..-2 run function tpa:tpadeny/deny_specific

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

execute unless score #deny_index tpa.variables matches -6..-2 run function tpa:tpaccept/show_selector
