# Strip the empty homes at the end of the home list.

execute unless data storage tpa:tpa temp.home_src[-1].x run data remove storage tpa:tpa temp.home_src[-1]

execute unless data storage tpa:tpa temp.home_src[-1].x if data storage tpa:tpa temp.home_src[-1] run function tpa:home/strip