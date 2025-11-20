execute unless data storage tpa:tpa temp.back_set run function tpa:back/push
data modify storage tpa:tpa back append from storage tpa:tpa temp.back_set
data remove storage tpa:tpa temp.back_set