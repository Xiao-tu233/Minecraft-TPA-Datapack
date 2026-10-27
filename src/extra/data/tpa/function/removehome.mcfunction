scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0
# 0:home, 1:sethome 2:removehome
scoreboard players set #home.trigger_state tpa.variables 2

function tpa:load_lang

execute if score #home tpa.config matches 0 run function tpa:home/disabled
execute if score #home tpa.config matches 1.. run function tpa:home/enabled
