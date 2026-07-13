scoreboard players operation #deny_index tpa.variables = @s tpa.tpaccept
execute if score #deny_index tpa.variables matches 0 run scoreboard players operation #deny_index tpa.variables = @s tpaccept
scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0

scoreboard players operation #recver tpa.variables = @s tpa.uid
scoreboard players reset #reqer tpa.variables
scoreboard players reset #direction tpa.variables
function tpa:requests/get
execute store result score #recved_requests tpa.variables run data get storage tpa:tpa temp.matched_requests

function tpa:load_lang

execute if score #recved_requests tpa.variables matches 0 run function tpa:tpaccept/no_request_found
execute if score #recved_requests tpa.variables matches 1 run function tpa:tpadeny/found
execute if score #recved_requests tpa.variables matches 2.. run function tpa:tpadeny/found_multiple
