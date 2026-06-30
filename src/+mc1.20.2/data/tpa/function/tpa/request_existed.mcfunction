# Parent function: tpa:tpa/recver_available
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.reqer_spam
function tpa:output/standard