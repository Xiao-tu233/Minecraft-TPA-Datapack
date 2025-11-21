#> tpa:req/tp_success.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tp_success"
# execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow showing: §adata storage tpa:tpa:"
# execute if score #debug_mode tpa_config matches 1 as @a run tellraw @a ["[§bTPA§r] §6 Debug: §a ", {"nbt":"","storage":"tpa:tpa"}]

#! DOWN BELOW↓
# Someone's pos stored count <= all stored pos(AKA #back_length), to remove all pos of one's,
# find_storage function need to be called as the times how many #back_length is

execute if score #back tpa_config matches 1 as @p[tag=to_modify] run function tpa:store_pos

#act tp
tp @p[tag=to_modify] @s
scoreboard players set @p[tag=to_modify] tp_to 0
function tpa:langtell/langtell_34
execute as @p[tag=to_modify] run function tpa:langtell/langtell_33
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rFound requester: " ,{"selector":"@p[tag=to_modify]"}]
#To tellraw
execute if score #debug_mode tpa_config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §rBreaking loop, skipped times:" ,{"score":{"name":"#i","objective":"tpa_variables"}}]
scoreboard players set #i tpa_variables 0
tag @a remove to_modify




