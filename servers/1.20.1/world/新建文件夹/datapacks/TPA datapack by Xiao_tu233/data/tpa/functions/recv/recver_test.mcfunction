#> tpa:recv/recver_test.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:recv/recver_test"
# Parent function: tpa:cancel_req, tpa:tpa, tpa:tpahere, tpa:time_out

tag @s add self
tag @p[tag=!to_except_being_selected] add to_modify

# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rself tp_to §a",{"score":{"name":"@s","objective":"tp_to"}}]
# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rself tp_here §a",{"score":{"name":"@s","objective":"tp_here"}}]
# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rmodifier playerid §a",{"score":{"name":"@p[tag=to_modify]","objective":"player_id"}}]
# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rj §a",{"score":{"name":"#j","objective":"tpa_variables"}}]

# For the calling from tpa:cancel
execute if score #j tpa_variables matches 1 if score @p[tag=to_modify] player_id = @s tp_to run function tpa:canceled_recv
execute if score #j tpa_variables matches 1 if score @p[tag=to_modify] player_id = @s tp_here run function tpa:canceled_recv
# For the calling from tpa:time_out
execute if score #j tpa_variables matches 2 if score @p[tag=to_modify] player_id = @s tp_to run function tpa:time_out_recv
execute if score #j tpa_variables matches 2 if score @p[tag=to_modify] player_id = @s tp_here run function tpa:time_out_recv
# From tpa:tpahere
execute if score #j tpa_variables matches 0 if score @p[tag=to_modify] player_id = @s tp_here run function tpa:recv/recv_tpahere

execute if score #j tpa_variables matches 0 if score @p[tag=to_modify] tpaccept_toggle matches 0 if score @p[tag=to_modify] player_id = @s tp_to run function tpa:recv/recv_tpa
# For Auto accepter, avoid receiving tpa request message
execute if score #j tpa_variables matches 0 if score @p[tag=to_modify] tpaccept_toggle matches 1 if score @p[tag=to_modify] player_id = @s tp_to run function tpa:always_accept_recv

# execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rRemain loop times: §a",{"score":{"name":"#i","objective":"tpa_variables"}}]

execute unless score @p[tag=to_modify] player_id = @s tp_to run tag @p[tag=to_modify] add to_except_being_selected
execute unless score @p[tag=to_modify] player_id = @s tp_to run tag @p[tag=to_modify] remove to_modify
execute unless score @p[tag=to_modify] player_id = @s tp_here run tag @p[tag=to_modify] add to_except_being_selected
execute unless score @p[tag=to_modify] player_id = @s tp_here run tag @p[tag=to_modify] remove to_modify
# For looping
scoreboard players remove #i tpa_variables 1
execute if score #i tpa_variables matches 1.. run function tpa:recv/recver_test