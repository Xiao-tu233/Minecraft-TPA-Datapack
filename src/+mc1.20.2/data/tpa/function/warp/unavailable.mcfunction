# Parent function: tpa:warp
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.warp_unavail
function tpa:output/standard