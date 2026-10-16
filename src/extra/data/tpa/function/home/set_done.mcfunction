# Parent function: tpa:home/set

function tpa:sounds/pick_orb
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_set
execute store result storage tpa:tpa temp.output.arg int 1 run data get storage tpa:tpa temp.home.id
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.output.arg
data modify storage tpa:tpa temp.output.dimension set from storage tpa:tpa temp.home.dimension
data modify storage tpa:tpa temp.output.x set from storage tpa:tpa temp.home.x
data modify storage tpa:tpa temp.output.y set from storage tpa:tpa temp.home.y
data modify storage tpa:tpa temp.output.z set from storage tpa:tpa temp.home.z
function tpa:output/home_set
