# Parent function: tpa:home/sethome_available

function tpa:get_name
execute store result storage tpa:tpa temp.args.id int 1 run scoreboard players get #home tpa.variables
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:home/set with storage tpa:tpa temp.args
