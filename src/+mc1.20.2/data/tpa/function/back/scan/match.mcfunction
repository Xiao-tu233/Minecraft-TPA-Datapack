# Parent function: tpa:back/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:back/ folder or even players

data modify storage tpa:tpa temp.back_scan set from storage tpa:tpa back[0]
execute if score #back.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.back_result set from storage tpa:tpa temp.back_scan
execute if score #back.replace_current tpa.variables matches 1 run data modify storage tpa:tpa back[0] set from storage tpa:tpa temp.back_candidate
execute unless score #back.remove_current tpa.variables matches 1 run data modify storage tpa:tpa back append from storage tpa:tpa back[0]