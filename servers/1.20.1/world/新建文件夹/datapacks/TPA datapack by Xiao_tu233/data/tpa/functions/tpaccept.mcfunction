#> tpa:tpaccept.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tpaccept"
#Function used to:
#deal with tpaccept trigger: >=1
scoreboard players set @s[scores={tpaccept=1}] accept 1
execute as @s[scores={tpaccept=2}] run scoreboard players set @s tpaccept_toggle 1
execute as @s[scores={tpaccept=2}] run function tpa:langtell/langtell_31
scoreboard players set @s[scores={tpaccept_toggle=1}] accept 1
execute as @s[scores={tpaccept=3}] run scoreboard players set @s tpaccept_toggle 0
execute as @s[scores={tpaccept=3}] run function tpa:langtell/langtell_32
execute as @s[scores={tpaccept=3}] run scoreboard players set @s accept 0

#Realizing the python-style program below
execute store result score #i tpa_variables if entity @a[tag=tp_reqer]
execute if score #i tpa_variables matches 1.. run function tpa:req/reqer_test

# $execute as @a if score @s tp_to matches $(player_id) run \
# execute as @a[scores={player_id=$(player_id),accept=1}] run function tpa:tp_success with storage tpa:tpa

scoreboard players set @s tpaccept 0


#planning program: Python style:
#    i : int = len(@a[tag=tp_reqer])
#    while i > 0:
#        tag @p[tag=tp_reqer,tag=!to_except_being_select] add to_modify
#        if score(@a[tag=to_modify],tp_to) == score(@s,player_id):
#            if score(@s,accept) == 1:
#                tp @a[tag=to_modify] @s
#                tag remove @a to_modify
#            elif score(@s,accept) == -1:
#                tag remove @a to_modify
#        else:
#            tag remove @a to_modify
#            tag @p[tag=to_modify] add to_except_being_select
#        i += 1
#    tag @a remove to_except_being_select

