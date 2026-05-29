# Parent function: tpa:recver_loop(THIS), tpa:recver_test

tag @p[tag=!not_match, scores={tpa.tp_to=2..}] add to_modify

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6Debug§r: Modifier now is: ",{"color":"green","selector":"@a[tag=to_modify]"}]

execute if score @s tpa.player_id = @p[tag=to_modify] tpa.tp_to unless score #reqer_id tpa.variables matches 2.. run scoreboard players set #is_reqer_found tpa.variables 1
execute if score @s tpa.player_id = @p[tag=to_modify] tpa.tp_to if score #reqer_id tpa.variables = @p[tag=to_modify] tpa.player_id run scoreboard players set #is_reqer_found tpa.variables 1

execute if score #is_reqer_found tpa.variables matches 0 unless score @s tpa.player_id = @p[tag=to_modify] tpa.tp_to run tag @p[tag=to_modify] add not_match
execute if score #is_reqer_found tpa.variables matches 0 unless score #reqer_id tpa.variables = @p[tag=to_modify] tpa.player_id run tag @p[tag=to_modify] add not_match
execute if score #is_reqer_found tpa.variables matches 0 run tag @a remove to_modify

execute if score #is_reqer_found tpa.variables matches 0 if entity @p[tag=!not_match] run function tpa:reqer_loop