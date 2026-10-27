# Parent function: tpa:home, tpa:sethome, tpa:removehome
function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.home_disabled
function tpa:output/standard
