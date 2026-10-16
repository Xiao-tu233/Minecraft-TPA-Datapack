# Parent function: tpa:tpaccept/update_menu

data remove storage tpa:tpa temp.accepted_request
execute if score #accept_index tpa.variables matches 6 run data modify storage tpa:tpa temp.accepted_request set from storage tpa:tpa temp.output.requests[0]
execute if score #accept_index tpa.variables matches 7 run data modify storage tpa:tpa temp.accepted_request set from storage tpa:tpa temp.output.requests[1]
execute if score #accept_index tpa.variables matches 8 run data modify storage tpa:tpa temp.accepted_request set from storage tpa:tpa temp.output.requests[2]
execute if score #accept_index tpa.variables matches 9 run data modify storage tpa:tpa temp.accepted_request set from storage tpa:tpa temp.output.requests[3]
execute if score #accept_index tpa.variables matches 10 run data modify storage tpa:tpa temp.accepted_request set from storage tpa:tpa temp.output.requests[4]

execute if data storage tpa:tpa temp.accepted_request run function tpa:tpaccept/accept_specific/act
