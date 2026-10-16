execute if score @s tpa matches 1.. run scoreboard players operation #recver tpa.variables = @s tpa
scoreboard players set @s tpa -1
execute if score @s tpa.tpa matches 1.. run scoreboard players operation #recver tpa.variables = @s tpa.tpa
scoreboard players set @s tpa.tpa -1

function tpa:load_lang

scoreboard players set #checking_direction tpa.variables 0

execute if score #time_out tpa.config matches 0 run function tpa:tpa/disabled
execute if score #time_out tpa.config matches 1.. run function tpa:tpa/enabled
