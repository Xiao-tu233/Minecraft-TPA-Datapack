# Parent function: tpa:recver_loop(THIS), tpa:recver_test

tag @p[tag=!not_match] add to_modify

execute if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rModifier now is: ",{color:"green",selector:"@a[tag=to_modify]"}]

execute if score @p[tag=to_modify] tpa.player_id = #recver_id tpa.variables run return 1

tag @p[tag=to_modify] add not_match
tag @a remove to_modify
scoreboard players remove #i tpa.variables 1
execute if score #i tpa.variables matches 0 run return 0
function tpa:recver_loop