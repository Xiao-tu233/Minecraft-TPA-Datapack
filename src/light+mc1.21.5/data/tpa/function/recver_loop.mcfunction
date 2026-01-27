tag @p[tag=!not_match] add to_modify
execute if score @p[tag=to_modify] tpa.player_id = #tp_to tpa run scoreboard players set #is_recver_found tpa 1
execute if score #is_recver_found tpa matches 0 run tag @p[tag=to_modify] add not_match
execute if score #is_recver_found tpa matches 0 run tag @a remove to_modify
execute if score #is_recver_found tpa matches 0 if entity @p[tag=!not_match] run function tpa:recver_loop