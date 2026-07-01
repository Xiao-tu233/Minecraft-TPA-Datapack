scoreboard players set @s tpa.cancel_req 0

scoreboard players reset #recver tpa.variables
scoreboard players operation #reqer tpa.variables = @s tpa.uid
scoreboard players reset #direction tpa.variables
function tpa:requests/get
execute store result score #recved_requests tpa.variables run data get storage tpa:tpa temp.matched_requests

function tpa:load_lang

execute if score #recved_requests tpa.variables matches 0 run function tpa:cancel_req/no_request_found
execute if score #recved_requests tpa.variables matches 1 run function tpa:cancel_req/found
execute if score #recved_requests tpa.variables matches 2.. run function tpa:cancel_req/found_multiple
