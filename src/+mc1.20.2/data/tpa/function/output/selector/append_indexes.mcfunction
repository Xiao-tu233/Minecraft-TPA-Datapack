
data modify storage tpa:tpa temp.output.start_index set string storage tpa:tpa temp.output.start_index
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.start_index
data modify storage tpa:tpa temp.output.selector_index append value "-"
data modify storage tpa:tpa temp.output.end_index set string storage tpa:tpa temp.output.end_index
data modify storage tpa:tpa temp.output.selector_index append from storage tpa:tpa temp.output.end_index