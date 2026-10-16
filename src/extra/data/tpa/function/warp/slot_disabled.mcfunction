# Parent functin: tpa:warp
function tpa:sounds/no

# Output
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_slot_disabled
data modify storage tpa:tpa temp.output.arg set from storage tpa:tpa temp.warp_result.name
data modify storage tpa:tpa temp.output.arg_hover set value ""
function tpa:output/one_arg