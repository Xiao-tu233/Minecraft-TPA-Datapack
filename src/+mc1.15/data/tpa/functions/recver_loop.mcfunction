# Parent function: tpa:recver_loop(THIS), tpa:recver_test

tag @p[tag=!not_match] add to_modify

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rModifier now is: ",{"color":"green","selector":"@a[tag=to_modify]"}]

execute if score @p[tag=to_modify] tpa.player_id = #recver_id tpa.variables run scoreboard players set #is_recver_found tpa.variables 1

execute if score #is_recver_found tpa.variables matches 0 run tag @p[tag=to_modify] add not_match
execute if score #is_recver_found tpa.variables matches 0 run tag @a remove to_modify

execute if score #is_recver_found tpa.variables matches 0 if entity @p[tag=!not_match] run function tpa:recver_loop