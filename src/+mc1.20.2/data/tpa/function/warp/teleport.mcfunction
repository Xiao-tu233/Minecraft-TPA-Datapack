# Parent function: tpa:warp
# @macro: {dim: str, x: int, y: int, z: int}
function tpa:back/set
$execute in $(dimension) run tp @s $(x) $(y) $(z)

function tpa:sounds/tp

# Output
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_teleport
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.warp_result.name
data modify storage tpa:tpa temp.output.arg_hover set from storage tpa:tpa temp.warp_result.desc
function tpa:output/one_arg