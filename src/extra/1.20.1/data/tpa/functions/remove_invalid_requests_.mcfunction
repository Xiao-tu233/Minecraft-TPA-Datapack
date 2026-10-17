
tag @p[tag=!not_match, scores={tpa.tp_to=2..}] add to_modify

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: Modifier now is: ",{"color":"green","selector":"@a[tag=to_modify]"}]

execute if score #offline_id tpa.variables = @p[tag=to_modify] tpa.tp_to as @p[tag=to_modify] run function tpa:remove_invalid_req

execute unless score #offline_id tpa.variables = @p[tag=to_modify] tpa.tp_to run tag @p[tag=to_modify] add not_match

tag @a remove to_modify

scoreboard players add #i tpa.variables 1

execute if score #i tpa.variables <= #j tpa.variables run function tpa:remove_invalid_requests_