# Parent function: tpa:home/get_dim
# @macro: {id: int, name: str}
$data modify storage tpa:tpa temp.args.old_dim set from storage tpa:tpa temp.home.$(id).dim
function tpa:dimension/update
$data modify storage tpa:tpa temp.home.$(id).dim set from storage tpa:tpa temp.args.new_dim
$data modify storage tpa:tpa home.$(name).$(id).dim set from storage tpa:tpa temp.args.new_dim