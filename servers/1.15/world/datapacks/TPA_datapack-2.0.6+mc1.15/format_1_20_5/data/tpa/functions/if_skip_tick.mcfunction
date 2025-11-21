execute if score #frequency tpa.config matches 0 run return 1
scoreboard players operation #tick_period tpa.variables = #20 tpa.variables
scoreboard players operation #tick_period tpa.variables /= #frequency tpa.config
execute store result score #game_time tpa.variables run time query gametime
scoreboard players operation #game_time tpa.variables %= #20 tpa.variables
scoreboard players operation #game_time tpa.variables %= #tick_period tpa.variables
execute if score #game_time tpa.variables matches 0 \
    run return 0
# else
    return 1