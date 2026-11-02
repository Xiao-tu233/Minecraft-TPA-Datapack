# Parent function: tpa:home/page/set, tpa:home/enabled

data modify storage tpa:tpa temp.home.page_candidate set value {}
execute store result storage tpa:tpa temp.home.page_candidate.uid int 1 run scoreboard players get #uid tpa.variables
execute store result storage tpa:tpa temp.home.page_candidate.page int 1 run scoreboard players get #home.page.candidate tpa.variables
execute store result storage tpa:tpa temp.home.page_candidate.max_id int 1 run scoreboard players get #home.max_id tpa.variables
data modify storage tpa:tpa home_pages append from storage tpa:tpa temp.home.page_candidate
