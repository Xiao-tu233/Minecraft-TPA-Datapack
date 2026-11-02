# Parent function: tpa:home/page/scan
#! This is a private function, shouldn't be called by functions outside tpa:home/page/ folder or even players

scoreboard players set #home.current_player tpa.variables -1
execute if data storage tpa:tpa home_pages[0].uid store result score #home.current_player tpa.variables run data get storage tpa:tpa home_pages[0].uid

execute if score #home.current_player tpa.variables = #uid tpa.variables run function tpa:home/page/scan/match

data modify storage tpa:tpa home_pages append from storage tpa:tpa home_pages[0]
data remove storage tpa:tpa home_pages[0]
execute unless data storage tpa:tpa home_pages[0].sentinel run function tpa:home/page/scan/loop
