# Parent function: tpa:home/get_homes
execute store result score #current_uid tpa.variables run data get storage tpa:tpa temp.home[0].uid
execute unless data storage tpa:tpa temp.home[0] run scoreboard players reset #current_uid tpa.variables

execute unless score #current_uid tpa.variables = @s tpa.uid run data modify storage tpa:tpa temp.home_notmatch append from storage tpa:tpa temp.home[0]
execute unless score #current_uid tpa.variables = @s tpa.uid run data remove storage tpa:tpa temp.home[0]

execute if score #current_uid tpa.variables = @s tpa.uid run scoreboard players set #is_uid_found tpa.variables 1
execute if score #current_uid tpa.variables = @s tpa.uid run data modify storage tpa:tpa temp.home_got set from storage tpa:tpa temp.home[0]
execute if score #current_uid tpa.variables = @s tpa.uid run data remove storage tpa:tpa temp.home[0]
execute if score #current_uid tpa.variables = @s tpa.uid run data modify storage tpa:tpa temp.home_notmatch append from storage tpa:tpa temp.home[]

execute if data storage tpa:tpa temp.home[0] unless score #is_uid_found tpa.variables matches 1 run function tpa:home/iter_uids