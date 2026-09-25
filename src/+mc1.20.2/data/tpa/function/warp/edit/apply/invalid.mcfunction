# Parent function: tpa:warp/edit/apply

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.warp_candidate
function tpa:sounds/no

data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.warp_edit_invalid
function tpa:output/standard