# Called by: (Player) Any OP, Quoted from: tpa:dimension/show_each_macro
# @macro: {index: int, namespaceid: str}
$data modify storage tpa:tpa option.dimension[$(index)].namespaceid set value "$(namespaceid)"
function tpa:dimension/menu