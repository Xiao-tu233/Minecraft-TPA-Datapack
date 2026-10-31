# Parent function: tpa:home/scan/loop
#! This is a private function, shouldn't be called by functions outside tpa:home/ folder or even players

data modify storage tpa:tpa temp.home_scan set from storage tpa:tpa home[0]
execute if score #home.store_result tpa.variables matches 1 run data modify storage tpa:tpa temp.home_result set from storage tpa:tpa temp.home_scan
execute if score #home.replace_current tpa.variables matches 1 run data modify storage tpa:tpa home[0] set from storage tpa:tpa temp.home_candidate
execute unless score #home.remove_current tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
scoreboard players set #home.matched tpa.variables 1
