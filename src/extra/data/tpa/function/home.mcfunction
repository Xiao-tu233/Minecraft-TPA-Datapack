execute unless score @s tpa.home matches 0 run scoreboard players operation #home tpa.variables = @s tpa.home
execute unless score @s home matches 0 run scoreboard players operation #home tpa.variables = @s home
scoreboard players set @s tpa.home 0
scoreboard players set @s home 0

function tpa:load_lang

execute if score #home tpa.config matches 0 run function tpa:home/disabled
execute if score #home tpa.config matches 1.. run function tpa:home/enabled