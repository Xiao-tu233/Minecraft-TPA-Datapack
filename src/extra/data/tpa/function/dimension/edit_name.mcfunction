# Called by: (Player) Any OP, Quoted from: tpa:dimension/show_each_macro
# @macro: {index: int, name: str}
$data modify storage tpa:tpa option.dimension[$(index)].name set value "$(name)"
function tpa:dimension/menu