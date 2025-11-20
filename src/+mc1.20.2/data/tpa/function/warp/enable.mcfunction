# Called by: (Player) Any OP, Quoted from: tpa:warp/show_each_macro
# @macro: {index: int}
$data modify storage tpa:tpa warp[$(index)].disabled set value 0b
function tpa:warp/option