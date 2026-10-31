# Parent function: tpa:home/scan
#! This is a private function, shouldn't be called by functions outside tpa:home/ folder or even players

# Read both identity fields from the current entry. A Home id is only unique
# within its owner's UID, so neither field may be omitted in exact mode.
scoreboard players set #home.current_uid tpa.variables -1
execute if data storage tpa:tpa home[0].uid store result score #home.current_uid tpa.variables run data get storage tpa:tpa home[0].uid
scoreboard players set #home.current_id tpa.variables -1
execute if data storage tpa:tpa home[0].id store result score #home.current_id tpa.variables run data get storage tpa:tpa home[0].id

scoreboard players set #home.matched tpa.variables 0
execute if score #home.current_uid tpa.variables = #uid tpa.variables if score #home.match_all tpa.variables matches 1 run function tpa:home/scan/match_range with storage tpa:tpa temp
execute if score #home.current_uid tpa.variables = #uid tpa.variables if score #home.match_all tpa.variables matches 0 if score #home.current_id tpa.variables = #home tpa.variables run function tpa:home/scan/match

# Keep entries that were not selected by the current operation.
execute unless score #home.matched tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
data remove storage tpa:tpa home[0]
execute unless data storage tpa:tpa home[0].sentinel run function tpa:home/scan/loop