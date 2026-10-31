# Parent function: tpa:home/set, tpa:home/get, tpa:home/remove
#! This is a private function, shouldn't be called by functions outside tpa:home/ folder or even players
#
# The Home storage is a flat list of compounds:
# {uid: int, id: int, x: int, y: int, z: int, dimension: string}
#
# Callers must set:
#   #uid                 player UID to match
#   #home                per-player Home id to match (exact mode)
#   #home.match_all      1 for the menu UID-only query, otherwise 0
#   #home.store_result   1 to write the matching entry/entries to temp.home_result
#   #home.remove_current 1 to remove the exact match
#   #home.replace_current 1 to replace the exact match with temp.home_candidate

# Add a sentinel so the list can be rotated without losing its original order.
data modify storage tpa:tpa home append value {sentinel: 1b}
scoreboard players set #home.match_found tpa.variables 0

# Rotate the list. The menu uses a compound keyed by Home id; exact calls use
# a single matching compound.
execute unless data storage tpa:tpa home[0].sentinel run function tpa:home/scan/loop

# Remove the sentinel after the scan is complete.
data remove storage tpa:tpa home[0]
