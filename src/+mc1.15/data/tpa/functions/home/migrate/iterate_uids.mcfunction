# Parent function: tpa:home/migrate, tpa:home/migrate/iterate_uids

scoreboard players set #i tpa.variables 0
data modify storage tpa:tpa home[0].homes append value {sentinel: 1b}
function tpa:home/migrate/iterate_home
data remove storage tpa:tpa home[0].homes[0]

data modify storage tpa:tpa home[0].homes[].uid set from storage tpa:tpa home[0].uid
data modify storage tpa:tpa temp.home append from storage tpa:tpa home[0].homes[]

data remove storage tpa:tpa home[0]
execute if data storage tpa:tpa home[0] run function tpa:home/migrate/iterate_uids