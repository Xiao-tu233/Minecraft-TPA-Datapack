# Parent function: tpa:cancel_req

scoreboard players set #selector_profile_created tpa.variables 0
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:cancel_req/selector/get
execute store result score #selector_profile_created tpa.variables run data get storage tpa:tpa temp.matched_selector

execute if score #selector_profile_created tpa.variables matches 0 run function tpa:cancel_req/create_menu
execute if score #selector_profile_created tpa.variables matches 1 run function tpa:cancel_req/update_menu

function tpa:cancel_req/show_selector