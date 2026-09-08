# Parent function: tpa:warp/upsert, tpa:warp/get, tpa:warp/remove, tpa:warp/extract
#! This is a private function, shouldn't be called by functions outside tpa:warp/ folder or even players
# Arguments: \
  scores: #warp.remove_current, #warp.replace_current, #warp.store_result, #warp \
  storage: temp.warp_candidate(necessary if #warp.replace_current==1)

# Usage: \
  data remove storage tpa:tpa temp.warp_result \
  scoreboard players set #warp.store_result tpa.variables ... \
  scoreboard players set #warp.remove_current tpa.variables ... \
  scoreboard players set #warp.replace_current tpa.variables ... \

# Add sentinel
data modify storage tpa:tpa warp append value {sentinel: 1b}

scoreboard players set #warp.current_slot tpa.variables 1

# Rotate list
execute unless data storage tpa:tpa warp[1].sentinel run function tpa:warp/scan/loop

# Remove sentinel
data remove storage tpa:tpa warp[1]
