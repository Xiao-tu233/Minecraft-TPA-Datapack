execute store result score #reqer tpa.variables run data get storage tpa:tpa temp.matched_requests[0].reqer
execute store result score #direction tpa.variables run data get storage tpa:tpa temp.matched_requests[0].direction
tag @a remove to_modify
execute as @a if score #reqer tpa.variables = @s tpa.uid run tag @s add to_modify

function tpa:requests/pop

function tpa:sounds/tp
execute as @p[tag=to_modify] run function tpa:sounds/tp
execute if score #direction tpa.variables matches 0 run function tpa:tpadeny/act
execute if score #direction tpa.variables matches 1 run function tpa:tpadeny/act_here

scoreboard players set @p[tag=to_modify] tpa.tp_to 0
scoreboard players set @p[tag=to_modify] tpa.tp_here 0
tag @a remove to_modify
