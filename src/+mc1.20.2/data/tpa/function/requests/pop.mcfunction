# Args: #reqer, #recver, #direction
data modify storage tpa:tpa requests append value {sentinel: 1b}
data modify storage tpa:tpa temp.matched_requests set value []
scoreboard players set #requests.popping tpa.variables 1
execute unless data storage tpa:tpa temp.requests[0].sentinel run function tpa:requests/loop
data remove storage tpa:tpa temp.requests[0]
