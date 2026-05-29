scoreboard players operation #tick_period tpa.variables = #20 tpa.variables
scoreboard players operation #tick_period tpa.variables /= #frequency tpa.config
execute store result score #game_time tpa.variables run time query gametime
scoreboard players operation #game_time tpa.variables %= #20 tpa.variables
execute unless score #frequency tpa.config matches 0 run scoreboard players operation #game_time tpa.variables %= #tick_period tpa.variables
execute if score #game_time tpa.variables matches 0 run scoreboard players set #if_skip_tick tpa.variables 0
# else
execute unless score #game_time tpa.variables matches 0 run scoreboard players set #if_skip_tick tpa.variables 1
execute if score #frequency tpa.config matches 0 run scoreboard players set #if_skip_tick tpa.variables 1