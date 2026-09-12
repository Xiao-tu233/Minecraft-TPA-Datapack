    # Parent function: tpa:warp/scan
#! This is a private function, shouldn't be called by functions outside tpa:warp/ folder or even players

scoreboard players add #warp.current_slot tpa.variables 1

execute unless score #warp.scan_count tpa.variables matches 2.. if score #warp.current_slot tpa.variables = #warp tpa.variables run function tpa:warp/scan/match
execute if score #warp.scan_count tpa.variables matches 2.. if score #warp.current_slot tpa.variables >= #warp tpa.variables if score #warp.current_slot tpa.variables <= #warp.end tpa.variables run function tpa:warp/scan/match_range

execute unless score #warp.scan_count tpa.variables matches 2.. unless score #warp.current_slot tpa.variables = #warp tpa.variables run data modify storage tpa:tpa warp append from storage tpa:tpa warp[1]
execute if score #warp.scan_count tpa.variables matches 2.. if score #warp.current_slot tpa.variables < #warp tpa.variables run data modify storage tpa:tpa warp append from storage tpa:tpa warp[1]
execute if score #warp.scan_count tpa.variables matches 2.. if score #warp.current_slot tpa.variables > #warp.end tpa.variables run data modify storage tpa:tpa warp append from storage tpa:tpa warp[1]

data remove storage tpa:tpa warp[1]
execute unless data storage tpa:tpa warp[1].sentinel run function tpa:warp/scan/loop
