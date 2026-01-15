# Parent function: tpa:home/iterator/main, tpa:home/iterator/iterate

execute store result score #current_home tpa.variables run data get storage tpa:tpa home[0].number
execute store result score #current_uid tpa.variables run data get storage tpa:tpa home[0].uid

# Mark that user has had home profile
execute if score #uid tpa.variables = #current_uid tpa.variables run scoreboard players set #uid_found tpa.variables 1

# Append every homes with matching uid
execute if score #uid tpa.variables = #current_uid tpa.variables run data modify storage tpa:tpa temp.home append from storage tpa:tpa home[0]

scoreboard players set #current_matching tpa.variables 0
execute if score #uid tpa.variables = #current_uid tpa.variables if score #home tpa.variables = #current_home tpa.variables run scoreboard players set #current_matching tpa.variables 1

# Matched and save current as outout or set current to input
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variables matches 0 run data modify storage tpa:tpa temp.home set from storage tpa:tpa home[0]
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variables matches 2 run data modify storage tpa:tpa temp.home set from storage tpa:tpa home[0]
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variables matches 1 run data modify storage tpa:tpa home[0] set from storage tpa:tpa temp.home
execute if score #current_matching tpa.variables matches 1 if score #op tpa.variables matches 1 run scoreboard players set #home_editted tpa.variables 1

# Not append if current matched and op is 2
execute unless score #current_matching tpa.variables matches 1 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]
execute if score #current_matching tpa.variables matches 1 unless score #op tpa.variables matches 2 run data modify storage tpa:tpa home append from storage tpa:tpa home[0]

data remove storage tpa:tpa home[0]
execute unless data storage tpa:tpa home[0].sentinel run function tpa:home/iterator/iterate