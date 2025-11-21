#> tpa:langtell/langtell_3a.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_3a"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"}," canceled the request. "]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"}," 取消了传送请求. "]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"}," 取消了傳送請求. "]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]"},"<Text here>"]