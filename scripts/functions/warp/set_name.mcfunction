# Called by: (Player) Any OP, Quoted from: tpa:warp/show_each_macro
# @macro: {index: int, name: str}
$data modify storage tpa:tpa warp[$(index)].name set value "$(name)"
function tpa:warp/option