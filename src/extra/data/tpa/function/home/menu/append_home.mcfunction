# Parent function: tpa:home/menu/has_home

scoreboard players add #home tpa.variables 1
function tpa:home/get
execute if data storage tpa:tpa temp.home_result run data modify storage tpa:tpa temp.home_page_entries append from storage tpa:tpa temp.home_result
