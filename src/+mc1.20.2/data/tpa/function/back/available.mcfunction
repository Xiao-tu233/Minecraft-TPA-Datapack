# Parent function: tpa:back/enabled
data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.uid int 1 run scoreboard players get @s tpa.uid
function tpa:back/get with storage tpa:tpa temp.args

execute unless data storage tpa:tpa temp.back run function tpa:back/not_found
execute if data storage tpa:tpa temp.back run function tpa:back/act with storage tpa:tpa temp.back