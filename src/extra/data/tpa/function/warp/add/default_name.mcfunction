# Parent function: tpa:warp/add

# data modify storage tpa:tpa warp[-1].name set from storage tpa:tpa loaded_lang.warp_default_name
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.warp_number set from storage tpa:tpa loaded_lang.warp_number
execute store result storage tpa:tpa temp.args.index int 1 run scoreboard players get #warp.index tpa.variables
function tpa:warp/add/concat with storage tpa:tpa temp.args