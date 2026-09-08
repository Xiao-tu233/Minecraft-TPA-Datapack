# Parent function: tpa:warp/page/get, tpa:warp/page/set
#! This is a private function, shouldn't be called by functions outside tpa:warp.page/ folder or even players
# Arguments: \
  scores: #warp.page.replace_current, #warp.page.store_result, #uid, #warp.page.candidate(necessary if #warp.page.replace_current==1)

# Outputs: \
  #warp.page.result(#warp.page.store_result==1)

# Usage: \
  scoreboard players set #warp.page.result tpa.variables -1 \
  scoreboard players set #warp.page.store_result tpa.variables ... \
  scoreboard players set #warp.page.replace_current tpa.variables ... \
  scoreboard players operation #uid tpa.variables = @s tpa.uid \

# Add sentinel
data modify storage tpa:tpa warp[0].page append value {sentinel: 1b}

# Rotate list
execute unless data storage tpa:tpa warp[0].pages[0].sentinel run function tpa:warp/page/scan/loop

# Remove sentinel
data remove storage tpa:tpa warp[0].pages[0]
