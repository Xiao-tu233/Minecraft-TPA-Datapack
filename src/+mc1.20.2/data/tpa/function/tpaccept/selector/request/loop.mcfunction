execute if score #selector.index tpa.variables >= #selector.start_index tpa.variables if score #selector.index tpa.variables <= #selector.end_index tpa.variables run function tpa:tpaccept/selector/request/match_range

scoreboard players add #selector.index tpa.variables 1
data remove storage tpa:tpa temp.selector.requests[0]
execute if data storage tpa:tpa temp.selector.requests[0] run function tpa:tpaccept/selector/request/loop
