# Parent Function: tpa:home/get_home
execute unless score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home_notmatch append from storage tpa:tpa temp.home[0]
execute unless score #i tpa.variables = #home tpa.variables run data remove storage tpa:tpa temp.home[0]

execute if score #i tpa.variables = #home tpa.variables run scoreboard players set #is_home_found tpa.variables 1
execute if score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home_got set from storage tpa:tpa temp.home[0]
# execute if score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home[0] set value {}
execute if score #i tpa.variables = #home tpa.variables if score #if_sethome tpa.variables matches 0 run data modify storage tpa:tpa temp.home[0] set value {}
execute if score #i tpa.variables = #home tpa.variables if score #if_sethome tpa.variables matches 1 run data modify storage tpa:tpa temp.home[0] set from storage tpa:tpa temp.home_src
execute if score #i tpa.variables = #home tpa.variables run data modify storage tpa:tpa temp.home_notmatch append from storage tpa:tpa temp.home[]

scoreboard players add #i tpa.variables 1

execute if data storage tpa:tpa temp.home[0] unless score #is_home_found tpa.variables matches 1 run function tpa:home/iter_homes