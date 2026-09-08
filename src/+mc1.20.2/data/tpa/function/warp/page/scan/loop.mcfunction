# Parent function: tpa:warp/page/scan
#! This is a private function, shouldn't be called by functions outside tpa:warp/page/ folder or even players

scoreboard players set #warp.current_player tpa.variables -1
execute if data storage tpa:tpa warp[0].pages[0].uid store result score #warp.current_player tpa.variables run data get storage tpa:tpa warp[0].pages[0].uid

execute if score #warp.current_player tpa.variables = #uid tpa.variables run function tpa:warp/page/scan/match
execute unless score #warp.current_player tpa.variables = #uid tpa.variables run data modify storage tpa:tpa warp[0].pages append from storage tpa:tpa warp[0].pages[0]

data remove storage tpa:tpa warp[0].pages[0]
execute unless data storage tpa:tpa warp[0].pages[0].sentinel run function tpa:warp/page/scan/loop
