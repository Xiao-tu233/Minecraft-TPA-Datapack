# Parent function: tpa:home/set
#! Update the Home identified by uid + id, or append it when absent.

data remove storage tpa:tpa temp.home_scan
data remove storage tpa:tpa temp.home_result
scoreboard players set #home.match_all tpa.variables 0
scoreboard players set #home.store_result tpa.variables 0
scoreboard players set #home.remove_current tpa.variables 0
scoreboard players set #home.replace_current tpa.variables 1
scoreboard players operation #uid tpa.variables = @s tpa.uid
function tpa:home/scan

# home/scan writes temp.home_scan only when the uid + id pair existed.
execute unless data storage tpa:tpa temp.home_scan run data modify storage tpa:tpa home append from storage tpa:tpa temp.home_candidate
