scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0
function tpa:load_lang
function tpa:home/conditions

scoreboard players operation #uid tpa.variables = @s tpa.uid
execute if score #error_code tpa.variables matches 0 run function tpa:home/remove

execute if score #error_code tpa.variables matches 0 run function tpa:home/menu

execute if score #error_code tpa.variables matches 0 if score #home_exists tpa.variables matches 0 run function tpa:home/remove/not_found
execute if score #error_code tpa.variables matches 0 if score #home_exists tpa.variables matches 1 run function tpa:home/remove/output

