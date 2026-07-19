# Parent function: tpa:home/enabled

data remove storage tpa:tpa temp.home
data remove storage tpa:tpa temp.args

# Check if player is asking for menu
execute if score #home tpa.variables matches ..-1 run function tpa:home/menu
execute unless score #home tpa.variables matches ..-1 run function tpa:home/selected