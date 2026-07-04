execute store result storage tpa:tpa temp.current_selector.uid int 1 run scoreboard players get #uid tpa.variables
execute store result score #selector.current_page tpa.variables run data get storage tpa:tpa temp.current_selector.page
scoreboard players add #selector.current_page tpa.variables 1
data modify storage tpa:tpa temp.current_selector.page set value 1
data modify storage tpa:tpa temp.current_selector.requests set from storage tpa:tpa temp.matched_requests
function tpa:cancel_req/selector/set