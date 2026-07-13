# Parent function: tpa:tpaccept/found_multiple

data modify storage tpa:tpa request_selector.recv append value {page: 1}
execute store result storage tpa:tpa request_selector.recv[-1].uid int 1 run scoreboard players get @s tpa.uid
data modify storage tpa:tpa request_selector.recv[-1].requests set from storage tpa:tpa temp.matched_requests
data modify storage tpa:tpa temp.matched_selector set from storage tpa:tpa request_selector.recv[-1]
