# Parent function: tpa:cancel_req/update_menu

data remove storage tpa:tpa temp.canceled_request
execute if score #cancel_index tpa.variables matches 3 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.output.requests[0]
execute if score #cancel_index tpa.variables matches 4 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.output.requests[1]
execute if score #cancel_index tpa.variables matches 5 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.output.requests[2]
execute if score #cancel_index tpa.variables matches 6 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.output.requests[3]
execute if score #cancel_index tpa.variables matches 7 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.output.requests[4]


execute if data storage tpa:tpa temp.canceled_request run function tpa:cancel_req/cancel_specific/act
