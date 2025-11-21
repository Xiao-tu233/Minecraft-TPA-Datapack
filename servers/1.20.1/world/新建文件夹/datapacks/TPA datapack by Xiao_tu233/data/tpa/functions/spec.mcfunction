#> tpa:spec.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:spec"

scoreboard players set @s player_id -1
tag @s add spec
