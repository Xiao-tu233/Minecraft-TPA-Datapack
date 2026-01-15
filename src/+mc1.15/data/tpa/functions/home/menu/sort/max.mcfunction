# Parent function: tpa:home/menu/sort, tpa:home/menu/sort/max

execute store result score #i tpa.variables run data get storage tpa:tpa temp.home[0].number

execute if score #i tpa.variables > #max tpa.variables run scoreboard players operation #max tpa.variables = #i tpa.variables

data modify storage tpa:tpa temp.home append from storage tpa:tpa temp.home[0]
data remove storage tpa:tpa temp.home[0]

execute unless data storage tpa:tpa temp.home[0].sentinel run function tpa:home/menu/sort/max