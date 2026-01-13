# Parent function: tpa:home/iterator/main, tpa:home/iterator/iterate

execute store result score #current_home tpa.variables run data get storage tpa:tpa home[0].number
execute store result score #current_uid tpa.variables run data get storage tpa:tpa home[0].uid
execute if score #uid tpa.variables = #current_uid tpa.variables run scoreboard players set #uid_found tpa.variables 1
scoreboard players set #current_matching tpa.variables 0
execute if score #uid tpa.variables = #current_uid tpa.variables if score #home tpa.variables = #current_home tpa.variables run scoreboard players set #current_matching tpa.variables 1

execute if score #current_matching tpa.variables matches 1 if score #op tpa.variable matches 0 run data modify storage tpa:tpa temp.home set from storage tpa:tpa home[0]
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variable matches 1 run data modify storage tpa:tpa home[0] set from storage tpa:tpa temp.home

execute unless score #current_matching tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variables matches 0..1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
data remove storage tpa:tpa home[0]
execute unless data storage tpa:tpa home[0].sentinel run function tpa:home/iterator/iterate