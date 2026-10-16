# Parent function: tpa:warp/menu
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.warp_disabled
function tpa:output/standard