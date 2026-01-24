# TPA tick function: run every ticks

# Frequency
execute if score #if_skip_tick tpa.variables matches 0 run scoreboard players set #ticks_skipped tpa.variables 0
function tpa:if_skip_tick

# If there's a teleport process running, stop another calculations in this tick to avoid the interference of other commands
execute if score #is_teleport_executing tpa.variables matches 1 run scoreboard players set #if_skip_tick tpa.variables 1
execute if score #is_teleport_executing tpa.variables matches 1 run function tpa:teleport/next_node

scoreboard players add #ticks_skipped tpa.variables 1
execute if score #if_skip_tick tpa.variables matches 0 run function tpa:tick_

# Call the tick function if the option is enabled
execute if score #uses_tick_scheduling tpa.config matches 1 run schedule function tpa:tick 1t