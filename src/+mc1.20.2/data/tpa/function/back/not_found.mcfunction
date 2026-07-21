# Parent function: tpa:back/available

function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.back_not_exist
function tpa:output/standard