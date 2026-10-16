# Parent function: tpa:home/each_home
# @macro: {id: int}
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
execute if score #is_updated_from_205 tpa.config matches 1 run function tpa:home/update_dim with storage tpa:tpa temp.args
data remove storage tpa:tpa temp.args.old_dim
$data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.home.$(id).dim
function tpa:dimension/get
data modify storage tpa:tpa temp.args.dim_color set from storage tpa:tpa temp.dimension.color