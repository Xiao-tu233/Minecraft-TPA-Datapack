# Parent function: tpa:back/upsert, tpa:back/get, tpa:back/remove, tpa:back/extract
#! This is a private function, shouldn't be called by functions outside tpa:back/ folder or even players
# Arguments: \
  scores: #back.remove_current, #back.replace_current, #back.store_result, #uid \
  storage: temp.back_candidate(necessary if #back.replace_current==1)

# Usage: \
  data remove storage tpa:tpa temp.back_result \
  scoreboard players set #back.store_result tpa.variables ... \
  scoreboard players set #back.remove_current tpa.variables ... \
  scoreboard players set #back.replace_current tpa.variables ... \
  scoreboard players operation #uid tpa.variables = @s tpa.uid \

# \
""" \
| 接口 | remove_current | replace_current | store_result | \
|---|---:|---:|---:| \
| `back/get` | 0 | 0 | 1 | \
| `back/extract` | 1 | 0 | 1 | \
| `back/remove` | 1 | 0 | 0 | \
| `back/upsert` | 0 | 1 | 0 | \
""" \

# Add sentinel
data modify storage tpa:tpa back append value {sentinel: 1b}

# Rotate list
execute unless data storage tpa:tpa back[0].sentinel run function tpa:back/scan/loop

# Remove sentinel
data remove storage tpa:tpa temp.back[0]