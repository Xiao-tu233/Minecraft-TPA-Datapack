scoreboard players operation #home tpa.variables = @s tpa.removehome
scoreboard players set @s tpa.removehome 0

function tpa:load_lang

# Check if player's able to modify homes
function tpa:home/conditions
execute unless score #error_code tpa.variables matches 1..2 run function tpa:home/removehome_available
