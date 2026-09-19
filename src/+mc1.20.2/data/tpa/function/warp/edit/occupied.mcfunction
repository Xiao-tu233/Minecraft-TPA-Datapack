# Parent function: tpa:warp/check_edittor

function tpa:sounds/no
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.arg set string storage tpa:tpa temp.warp_edit.uid
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_edit_occupied
data modify storage tpa:tpa temp.output.arg_hover set value ""
function tpa:output/one_arg