
execute if score #selector.index tpa.variables >= #selector.start_index tpa.variables if score #selector.index tpa.variables <= #selector.end_index tpa.variables run function tpa:cancel_req/selector/request/match_range

scoreboard players add #selector.index tpa.variables 1
data remove storage tpa:tpa temp.matched_selector.requests[0]
execute if data storage tpa:tpa temp.matched_selector.requests[0] run function tpa:cancel_req/selector/request/loop