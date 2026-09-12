# Parent function: tpa:warp/set, tpa:warp/get, tpa:warp/remove, tpa:warp/menu
#! This is a private function, shouldn't be called by functions outside tpa:warp/ folder or even players
# Arguments: \
  scores: #warp.remove_current, #warp.replace_current, #warp.store_result, #warp.scan_count, #warp \
  storage: temp.warp_candidate(necessary if #warp.replace_current==1, List if #warp.scan_count>1)

# Usage: \
  data remove storage tpa:tpa temp.warp_result \
  scoreboard players set #warp.store_result tpa.variables ... \
  scoreboard players set #warp.remove_current tpa.variables ... \
  scoreboard players set #warp.replace_current tpa.variables ... \
  scoreboard players set #warp.scan_count tpa.variables ... \

# Add sentinel
data modify storage tpa:tpa warp append value {sentinel: 1b}

scoreboard players set #warp.current_slot tpa.variables 0

execute if score #warp.replace_current tpa.variables matches 1 store result score #warp.scan_count tpa.variables run data get storage tpa:tpa temp.warp_candidate

scoreboard players set #warp.end tpa.variables -1
scoreboard players operation #warp.end tpa.variables += #warp tpa.variables
scoreboard players operation #warp.end tpa.variables += #warp.scan_count tpa.variables
execute if score #warp.scan_count tpa.variables matches 2.. run data modify storage tpa:tpa temp.warp_scan set value []

# Rotate list
execute unless data storage tpa:tpa warp[1].sentinel run function tpa:warp/scan/loop

# Remove sentinel
data remove storage tpa:tpa warp[1]
