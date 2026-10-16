scoreboard players operation #recver tpa.variables = @s tpa.tpahere
scoreboard players set @s tpa.tpahere -1

function tpa:load_lang

scoreboard players set #checking_direction tpa.variables 1

execute if score #time_out tpa.config matches 0 run function tpa:tpa/disabled
execute if score #time_out tpa.config matches 1.. run function tpa:tpa/enabled
