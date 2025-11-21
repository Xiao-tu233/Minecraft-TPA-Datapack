#> tpa:req/reqer_test.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:reqer_test"

# Parent function: tpa:tpaccept

tag @p[tag=tp_reqer,tag=!to_except_being_selected] add to_modify
tag @s add self

execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rRemain loop times: §a",{"score":{"name":"#i","objective":"tpa_variables"}}]
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rThe modifier now is: §a",{"selector":"@a[tag=to_modify]"}]

execute if score @p[tag=to_modify] tp_to = @s player_id run function tpa:req/reqer_matched
execute unless score @p[tag=to_modify] tp_here = @s player_id run function tpa:req/reqer_not_matched

execute if score @p[tag=to_modify] tp_here = @s player_id run function tpa:req/reqer_here
execute unless score @p[tag=to_modify] tp_here = @s player_id run function tpa:req/reqer_not_matched
# For looping
scoreboard players remove #i tpa_variables 1
execute if score #i tpa_variables matches 1.. run function tpa:req/reqer_test
execute if score #debug_mode tpa_config matches 1 if score #i tpa_variables matches 0 run tellraw @a ["[§bTPA§r] §6 Debug: §rLoop ends."]
tag @a remove to_except_being_selected

#planning program: Python style:
#    i : int = len(@a[tag=tp_reqer])
#    while i > 0:
#        tag @p[tag=tp_reqer,tag=!to_except_being_select] add to_modify
#        if tp_to[@a[tag=to_modify]] == player_id[@s]:
#            if accept[@s] == 1:
#                tp @a[tag=to_modify] @s
#                tag remove @a to_modify
#            elif accept[@s] == -1:
#                tag remove @a to_modify
#        else:
#            tag remove @a to_modify
#            tag @p[tag=to_modify] add to_except_being_selected
#        i += 1
#    tag @a remove to_except_being_selected

