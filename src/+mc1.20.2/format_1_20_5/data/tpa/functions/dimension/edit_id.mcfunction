# Called by: (Player) Any OP, Quoted from: tpa:dimension/show_each_macro
# @macro: {index: int, id: str}
$data modify storage tpa:tpa option.dimension[$(index)].id set value $(id)
function tpa:dimension/menu