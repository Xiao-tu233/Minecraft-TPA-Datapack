# Parent function: tpa:cancel_req

scoreboard players set #selector_profile_created tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:cancel_req/selector/get
execute store result score #selector_profile_created tpa.variables run data get storage tpa:tpa temp.matched_selector

execute store result score #selector.total_requests tpa.variables run data get storage tpa:tpa temp.matched_requests
execute store result storage tpa:tpa temp.output.total_requests int 1 run scoreboard players get #selector.total_requests tpa.variables
data modify storage tpa:tpa temp.output.total_requests set string storage tpa:tpa temp.output.total_requests
scoreboard players operation #selector.total_pages tpa.variables = #selector.total_requests tpa.variables
scoreboard players remove #selector.total_pages tpa.variables 1
scoreboard players operation #selector.total_pages tpa.variables /= #5 tpa.variables
scoreboard players add #selector.total_pages tpa.variables 1
execute store result storage tpa:tpa temp.output.total_pages int 1 run scoreboard players get #selector.total_pages tpa.variables

execute if score #selector_profile_created tpa.variables matches 0 run function tpa:cancel_req/create_menu
execute if score #selector_profile_created tpa.variables matches 1.. run function tpa:cancel_req/update_menu

execute unless score #cancel_index tpa.variables matches 3..7 run function tpa:cancel_req/show_selector
