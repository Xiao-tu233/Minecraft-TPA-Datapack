# @param: 
#   #home (id): home id.
# @return: 
#   storage tpa:tpa temp.home: compound, <= storage tpa:tpa temp.home[id]
#   storage tpa:tpa temp.home_notmatch: list, <= storage tpa:tpa temp.home - storage tpa:tpa temp.home_got
scoreboard players set #is_home_found tpa.variables 0
scoreboard players set #if_sethome tpa.variables 0
data modify storage tpa:tpa temp.home_notmatch set value [{}]
data modify storage tpa:tpa temp.home_got set value []
data remove storage tpa:tpa temp.home[0]
scoreboard players set #i tpa.variables 1
execute if data storage tpa:tpa temp.home run function tpa:home/iter_homes
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_got
execute unless data storage tpa:tpa temp.home.x run scoreboard players set #is_home_found tpa.variables 0