# Parent function: tpa:home/menu/sort/ensure_index, tpa:home/menu/sort/scan_for_index

execute store result score #current_number tpa.variables run data get storage tpa:tpa temp.home[0].number

execute if score #i tpa.variables = #current_number tpa.variables run data modify storage tpa:tpa temp.home_sorted[0] merge from storage tpa:tpa temp.home[0]

data modify storage tpa:tpa temp.home append from storage tpa:tpa temp.home[0]
data remove storage tpa:tpa temp.home[0]

execute unless data storage tpa:tpa temp.home[0].sentinel run function tpa:home/menu/sort/scan_for_index