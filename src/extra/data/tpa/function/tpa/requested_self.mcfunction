# Parent function: tpa:tpa/enabled
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.reqer_self
function tpa:output/standard