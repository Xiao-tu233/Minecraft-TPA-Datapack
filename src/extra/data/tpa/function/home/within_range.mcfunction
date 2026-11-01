# Parent function: tpa:home/selected

# Set/overwrite current home no matter if current exists
execute if score #home.trigger_state tpa.variables matches 1 run function tpa:home/set
execute unless score #home.trigger_state tpa.variables matches 1 run function tpa:home/check_selected