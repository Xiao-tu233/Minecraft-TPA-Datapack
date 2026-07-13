# Parent function: tpa:tpadeny/found_multiple

data remove storage tpa:tpa temp.denied_request
execute if score #deny_index tpa.variables matches -2 run data modify storage tpa:tpa temp.denied_request set from storage tpa:tpa temp.output.requests[0]
execute if score #deny_index tpa.variables matches -3 run data modify storage tpa:tpa temp.denied_request set from storage tpa:tpa temp.output.requests[1]
execute if score #deny_index tpa.variables matches -4 run data modify storage tpa:tpa temp.denied_request set from storage tpa:tpa temp.output.requests[2]
execute if score #deny_index tpa.variables matches -5 run data modify storage tpa:tpa temp.denied_request set from storage tpa:tpa temp.output.requests[3]
execute if score #deny_index tpa.variables matches -6 run data modify storage tpa:tpa temp.denied_request set from storage tpa:tpa temp.output.requests[4]

execute if data storage tpa:tpa temp.denied_request run function tpa:tpadeny/deny_specific/act
