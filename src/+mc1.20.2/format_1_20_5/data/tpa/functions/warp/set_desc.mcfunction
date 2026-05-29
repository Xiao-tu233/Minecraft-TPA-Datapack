# Called by: (Player) Any OP, Quoted from: tpa:warp/show_each_macro
# @macro: {index: int, desc: str}
$data modify storage tpa:tpa warp[$(index)].desc set value "$(desc)"
function tpa:warp/option