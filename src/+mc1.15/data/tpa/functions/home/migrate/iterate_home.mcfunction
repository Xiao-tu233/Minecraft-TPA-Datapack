# Parent function tpa:home/migrate/iterate_uids, tpa:home/migrate/iterate_home

execute store result storage tpa:tpa home[0].homes[0].number int 1 run scoreboard players get #i tpa.variables

data modify storage tpa:tpa home[0].homes append from storage tpa:tpa home[0].homes[0]
data remove storage tpa:tpa home[0].homes[0]

scoreboard players add #i tpa.variables 1
execute unless data storage tpa:tpa home[0].homes[0].sentinel run function tpa:home/migrate/iterate_home