#> tpa:search_id.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:search_id"
function tpa:langtell/langtell_26
scoreboard players set @s search_id 0