#> tpa:langtell/langtell_51.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_51"
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You muted datapack noices."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你静音了数据包."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你靜音了資料包."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>."]