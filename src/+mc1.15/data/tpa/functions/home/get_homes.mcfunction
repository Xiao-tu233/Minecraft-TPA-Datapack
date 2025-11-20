# @param: uid: player's uid
# @return: 
#   storage tpa:tpa temp.home: list[compound], <= storage tpa:tpa home[uid]
#   storage tpa:tpa temp.home_notmatch: list[compound]. <= storage tpa:tpa home[uid] - storage tpa:tpa temp.home
data modify storage tpa:tpa temp.home set from storage tpa:tpa home
scoreboard players set #is_uid_found tpa.variables 0
data modify storage tpa:tpa temp.home_notmatch set value []
data modify storage tpa:tpa temp.home_got set value []
execute if data storage tpa:tpa temp.home[0] if score @s tpa.uid = @s tpa.uid run function tpa:home/iter_uids
data modify storage tpa:tpa temp.home set from storage tpa:tpa temp.home_got.homes