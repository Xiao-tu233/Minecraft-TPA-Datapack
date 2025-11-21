scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0
function tpa:load_lang
function tpa:home/conditions

data remove storage tpa:tpa temp.home
execute if score #error_code tpa.variables matches 0 run function tpa:home/check_home

execute if score #error_code tpa.variables matches 0 run function tpa:home/remove