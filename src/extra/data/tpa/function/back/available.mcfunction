# Parent function: tpa:back/enabled
function tpa:back/extract

execute unless data storage tpa:tpa temp.back_result run function tpa:back/not_found
execute if data storage tpa:tpa temp.back_result run function tpa:back/act with storage tpa:tpa temp.back_result