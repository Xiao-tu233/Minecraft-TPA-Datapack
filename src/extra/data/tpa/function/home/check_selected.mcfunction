# Parent function: tpa:home/within_range

function tpa:home/get

execute unless data storage tpa:tpa temp.home_result run function tpa:home/not_found
execute if data storage tpa:tpa temp.home_result run function tpa:home/found
