# Called by: (Player) Any OP, Quoted from: tpa:dimension/show_each_macro
# @macro: {index: int, color: str}
$data modify storage tpa:tpa option.dimension[$(index)].color set value "$(color)"
function tpa:dimension/menu