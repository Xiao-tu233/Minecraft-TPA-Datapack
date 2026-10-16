# Parent function: tpa:warp/menu
# Normalize a single compound result to a one-element list.
data modify storage tpa:tpa warp[0].result set from storage tpa:tpa temp.warp_result 
data modify storage tpa:tpa temp.warp_result set value []
data modify storage tpa:tpa temp.warp_result append from storage tpa:tpa warp[0].result
