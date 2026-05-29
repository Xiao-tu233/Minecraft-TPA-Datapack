# Parent function: tpa:warp/movedown
# @macro_param: {index: int, next_index: int}

$execute unless data storage tpa:tpa warp[$(next_index)] run data modify storage tpa:tpa warp append value {x: 0, y: 0, z: 0, dim: "minecraft:overworld", name: "Missing Warp", desc: "", disabled: true}

data remove storage tpa:tpa temp.warp
$data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp[$(index)]
$data modify storage tpa:tpa warp[$(index)] set from storage tpa:tpa warp[$(next_index)]
$data modify storage tpa:tpa warp[$(next_index)] set from storage tpa:tpa temp.warp