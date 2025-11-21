#>tpa:help.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:help"
#the first help page
execute as @s[scores={help=1}] run function tpa:langtell/langtell_11
#the 2nd help page
execute as @s[scores={help=2}] run function tpa:langtell/langtell_12
scoreboard players set @s help 0