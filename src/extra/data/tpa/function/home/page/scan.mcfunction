# Parent function: tpa:home/page/get, tpa:home/page/set
#! This is a private function, shouldn't be called by functions outside tpa:home.page/ folder or even players
# Arguments: \
  scores: #home.page.replace_current, #home.page.store_result, #home.page.update_max_id, #uid, #home.page.candidate(necessary if #home.page.replace_current==1)

# Outputs: \
  #home.page.result(#home.page.store_result==1)

# Usage: \
  scoreboard players set #home.page.result tpa.variables -1 \
  scoreboard players set #home.page.store_result tpa.variables ... \
  scoreboard players set #home.page.replace_current tpa.variables ... \
  scoreboard players operation #uid tpa.variables = @s tpa.uid \

# Add sentinel
data modify storage tpa:tpa home_pages append value {sentinel: 1b}

# Rotate list
execute unless data storage tpa:tpa home_pages[0].sentinel run function tpa:home/page/scan/loop

# Remove sentinel
data remove storage tpa:tpa home_pages[0]
