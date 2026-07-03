# Parent function: tpa:tpa/recver_available
scoreboard players operation #reqer tpa.variables = @s tpa.uid
scoreboard players operation #direction tpa.variables = #checking_direction tpa.variables
function tpa:requests/get
execute store result score #requests_existed tpa.variables run data get storage tpa:tpa temp.matched_requests

execute if score #requests_existed tpa.variables matches 1 run function tpa:tpa/request_existed

execute if score #requests_existed tpa.variables matches 0 if score #checking_direction tpa.variables matches 0 run function tpa:tpa/request_not_existed
execute if score #requests_existed tpa.variables matches 0 if score #checking_direction tpa.variables matches 1 run function tpa:tpahere/add_request