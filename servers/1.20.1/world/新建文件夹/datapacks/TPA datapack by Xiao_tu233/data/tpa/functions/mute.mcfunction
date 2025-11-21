#> tpa:if_mute.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:idfix"
# 1: mute 2: unmute
execute as @s[scores={to_mute=1}] run scoreboard players set @s mute 1
execute as @s[scores={to_mute=1}] run function tpa:langtell/langtell_52
execute as @s[scores={to_mute=2}] run scoreboard players set @s mute 0
execute as @s[scores={to_mute=2}] run function tpa:langtell/langtell_51
scoreboard players set @s to_mute 0
