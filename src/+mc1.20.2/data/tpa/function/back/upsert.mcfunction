# Parent function: tpa:back/set

# \
""" \
upsert = update OR insert \
""" \

data remove storage tpa:tpa temp.back_result 
data remove storage tpa:tpa temp.back_scan
scoreboard players set #back.store_result tpa.variables 0
scoreboard players set #back.remove_current tpa.variables 0
scoreboard players set #back.replace_current tpa.variables 1
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:back/scan

# Insert if not found
execute unless data storage tpa:tpa temp.back_scan run data modify storage tpa:tpa back append from storage tpa:tpa temp.back_candidate
