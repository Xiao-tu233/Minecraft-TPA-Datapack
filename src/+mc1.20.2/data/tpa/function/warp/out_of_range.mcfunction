# Parent function: tpa:warp/selected
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.warp_out_of_range
function tpa:output/standard