# Parent function: tpa:home
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.home_create
function tpa:output/standard
