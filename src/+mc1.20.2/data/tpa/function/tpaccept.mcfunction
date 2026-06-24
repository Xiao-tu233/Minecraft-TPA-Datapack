scoreboard players operation #reqer_id tpa.variables = @s tpa.tpaccept
scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0

scoreboard players operation #recver tpa.variables = @s tpa.uid
scoreboard players reset #reqer tpa.variables
scoreboard players reset #direction tpa.variables
function tpa:requests/get
execute store result score #recved_requests tpa.variables run data get storage tpa:tpa temp.matched_requests

# execute store result score #is_reqer_found tpa.variables run function tpa:reqer_test

function tpa:load_lang

execute if score #recved_requests tpa.variables matches 0 run function tpa:tpaccept/no_request_found
execute if score #recved_requests tpa.variables matches 1 run function tpa:tpaccept/found
execute if score #recved_requests tpa.variables matches 2.. run function tpa:tpaccept/