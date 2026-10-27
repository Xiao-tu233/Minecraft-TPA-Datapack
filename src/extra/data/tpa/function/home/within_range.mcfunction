# Parent function: tpa:home/selected

# Tip the player if he hasn't had a home yet
execute if score #home.trigger_state tpa.variables matches 1 run function tpa:home/set
execute unless score #home.trigger_state tpa.variables matches 1 run function tpa:home/check_selected