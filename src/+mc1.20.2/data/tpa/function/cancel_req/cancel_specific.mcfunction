# Parent function: tpa:cancel_req/update_menu

execute if score #cancel_index tpa.variables matches 3 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.matched_selector.requests[0]
execute if score #cancel_index tpa.variables matches 4 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.matched_selector.requests[1]
execute if score #cancel_index tpa.variables matches 5 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.matched_selector.requests[2]
execute if score #cancel_index tpa.variables matches 6 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.matched_selector.requests[3]
execute if score #cancel_index tpa.variables matches 7 run data modify storage tpa:tpa temp.canceled_request set from storage tpa:tpa temp.matched_selector.requests[4]


execute store result score #reqer tpa.variables run data get storage tpa:tpa temp.canceled_request.reqer
execute store result score #recver tpa.variables run data get storage tpa:tpa temp.canceled_request.recver
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.canceled_request.direction

function tpa:cancel_req/act

function tpa:requests/update/remove