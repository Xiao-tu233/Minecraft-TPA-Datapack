# Parent function: tpa:warp/moveup
# @macro_param: {index: int, previous_index: int}

data remove storage tpa:tpa temp.warp
$data modify storage tpa:tpa temp.warp set from storage tpa:tpa warp[$(index)]
$data modify storage tpa:tpa warp[$(index)] set from storage tpa:tpa warp[$(previous_index)]
$data modify storage tpa:tpa warp[$(previous_index)] set from storage tpa:tpa temp.warp