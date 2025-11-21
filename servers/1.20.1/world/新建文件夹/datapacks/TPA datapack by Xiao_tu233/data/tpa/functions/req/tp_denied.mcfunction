#> tpa:req/tp_denied.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tp_denied"

function tpa:langtell/langtell_36
execute as @p[tag=to_modify] run function tpa:langtell/langtell_35
tag @a remove to_modify

