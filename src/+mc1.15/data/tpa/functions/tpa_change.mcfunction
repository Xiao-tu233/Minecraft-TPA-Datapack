# Parent function: tpa:tpa, tpa:tpahere
scoreboard players operation #recver_id tpa.variables = @s tpa.tp_to
function tpa:recver_test
execute if score #is_recver_found tpa.variables matches 1 run scoreboard players set @s tpa.tp_to 0
execute if score #is_recver_found tpa.variables matches 1 run tag @p[tag=to_modify] add temp_modify
tag @a remove to_modify