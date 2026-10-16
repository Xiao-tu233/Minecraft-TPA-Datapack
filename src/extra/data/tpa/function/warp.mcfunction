scoreboard players operation #warp tpa.variables = @s tpa.warp
scoreboard players set @s tpa.warp 0

function tpa:load_lang

execute unless predicate tpa:available run function tpa:warp/unavailable
execute if predicate tpa:available run function tpa:warp/available