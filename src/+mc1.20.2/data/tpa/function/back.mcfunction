scoreboard players set @s tpa.back 0
scoreboard players set @s back 0

function tpa:load_lang

execute if score #back tpa.config matches 1 run function tpa:back/disabled
execute if score #back tpa.config matches 0 run function tpa:back/enabled