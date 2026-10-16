data modify storage tpa:tpa requests append value {sentinel: 1b}
execute unless data storage tpa:tpa requests[0].sentinel run function tpa:requests/update/loop
data remove storage tpa:tpa requests[0]