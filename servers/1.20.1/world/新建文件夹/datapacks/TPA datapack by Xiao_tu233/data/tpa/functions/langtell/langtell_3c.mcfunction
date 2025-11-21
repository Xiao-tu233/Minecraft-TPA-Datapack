#> tpa:langtell/langtell_3c.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_3c"
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"},"'s request is timed out."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"},"的传送请求已过期."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"},"的傳送請求已過期."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"},"<Text here>"]