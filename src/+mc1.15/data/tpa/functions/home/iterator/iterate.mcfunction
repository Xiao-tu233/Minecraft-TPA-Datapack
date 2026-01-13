# Parent function: tpa:home/iterator/append_sentinel, tpa:home/iterator/iterate



data modify storage tpa:tpa home append from storage tpa:tpa home[0]
data remove storage tpa:tpa home[0]
execute unless data storage tpa:tpa home[0].sentinel run function tpa:home/iterator/iterate