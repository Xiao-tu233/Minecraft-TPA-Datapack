# Parent function: tpa:cancel_req/multiple_found

execute if score #cancel_index tpa.variables matches 1 run function tpa:cancel_req/pass
execute if score #cancel_index tpa.variables matches 2 run function tpa:cancel_req/previous_page
execute if score #cancel_index tpa.variables matches 3..7 run function tpa:cancel_req/cancel_specific
execute if score #cancel_index tpa.variables matches 8 run function tpa:cancel_req/next_page


execute store result storage tpa:tpa temp.current_selector.uid int 1 run scoreboard players get #uid tpa.variables
data modify storage tpa:tpa temp.current_selector.page set value 1
data modify storage tpa:tpa temp.current_selector.requests set from storage tpa:tpa temp.matched_requests
function tpa:cancel_req/selector/set