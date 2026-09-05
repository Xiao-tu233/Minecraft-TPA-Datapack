# Parent function: tpa:back/scan
#! This is a private function, shouldn't be called by functions outside tpa:back/ folder or even players

execute store result score #back.current_player tpa.variables run data get storage tpa:tpa back[0].uid

execute if score #back.current_player tpa.variables = #uid tpa.variables run function tpa:back/scan/match
execute unless score #back.current_player tpa.variables = #uid tpa.variables run data modify storage tpa:tpa back append from storage tpa:tpa back[0]

data remove storage tpa:tpa back[0]
execute unless data storage tpa:tpa back[0].sentinel run function tpa:back/scan/loop