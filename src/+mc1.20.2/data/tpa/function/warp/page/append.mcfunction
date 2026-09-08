# Parent function: tpa:warp/page/set

data modify storage tpa:tpa temp.warp.page_candidate set value {}
execute store result storage tpa:tpa temp.warp.page_candidate.uid int 1 run scoreboard players get #uid tpa.variables
execute store result storage tpa:tpa temp.warp.page_candidate.page int 1 run scoreboard players get #warp.page.candidate tpa.variables
data modify storage tpa:tpa warp[0].pages append from storage tpa:tpa temp.warp.page_candidate