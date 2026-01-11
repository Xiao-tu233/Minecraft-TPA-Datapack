scoreboard players operation #home tpa.variables = @s tpa.sethome
scoreboard players set @s tpa.sethome 0
function tpa:load_lang
function tpa:home/conditions

execute if score #error_code tpa.variables matches 0 run function tpa:home/set