#>tpa:tpamenu.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:tpamenu"
# execute as @s[scores={tpamenu=1}] run function tpa:langtell/langtell_24
execute as @s[scores={tpamenu=1..}] run function tpa:langtell/langtell_24
#page max is 999 because 1000 page cause \n added automatically
scoreboard players set @s tpamenu 0
