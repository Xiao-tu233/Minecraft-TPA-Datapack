#> tpa:req/reqer_not_matched.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:reqer_not_matched"

tag @p[tag=to_modify] add to_except_being_selected
tag @a remove to_modify

#planning program: Python style:
#    i : int = len(@a[tag=tp_reqer])
#    while i > 0:
#        tag @p[tag=tp_reqer,tag=!to_except_being_selected] add to_modify
#        if score(@a[tag=to_modify],tp_to) == score(@s,player_id):
#            if score(@s,accept) == 1:
#                tp @a[tag=to_modify] @s
#                tag remove @a to_modify
#            elif score(@s,accept) == -1:
#                tag remove @a to_modify
#        else:
#            tag remove @a to_modify
#            tag @p[tag=to_modify] add to_except_being_selected
#        i += 1
#    tag @a remove to_except_being_selected

