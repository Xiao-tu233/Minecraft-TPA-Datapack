# Parent function: tpa:on_join
data remove storage tpa:tpa temp.args
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:update/home/scan_player/check with storage tpa:tpa temp.args
