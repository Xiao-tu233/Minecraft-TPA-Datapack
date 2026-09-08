# Parent function: tpa:warp/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:warp/ folder or even players

data modify storage tpa:tpa temp.warp_scan set from storage tpa:tpa warp[1]
execute if score #warp.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.warp_result set from storage tpa:tpa temp.warp_scan
execute if score #warp.replace_current tpa.variables matches 1 run data modify storage tpa:tpa warp[1] set from storage tpa:tpa temp.warp_candidate
execute unless score #warp.remove_current tpa.variables matches 1 run data modify storage tpa:tpa warp append from storage tpa:tpa warp[1]