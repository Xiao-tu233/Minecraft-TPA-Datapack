# Parent function: tpa:home/within_range

execute if score #home.trigger_state tpa.variables matches 2 run function tpa:home/remove
execute unless score #home.trigger_state tpa.variables matches 2 run function tpa:home/has_home
