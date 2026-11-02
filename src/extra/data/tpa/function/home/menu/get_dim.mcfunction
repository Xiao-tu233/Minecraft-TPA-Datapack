# Parent function: tpa:home/each_home
# @macro: {id: int}

$data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.home.$(id).dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.args.dim_color set from storage tpa:tpa temp.dimension.color
