# Parent function: tpa:home/enabled

# Check if player is asking for menu
execute if score #home tpa.variables matches ..-1 run function tpa:home/menu
execute unless score #home tpa.variables matches ..-1 run function tpa:home/selected