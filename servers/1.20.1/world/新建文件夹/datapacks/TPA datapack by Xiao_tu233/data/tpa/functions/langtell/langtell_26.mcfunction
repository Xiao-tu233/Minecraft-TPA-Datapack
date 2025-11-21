#> tpa:langtell/langtell_26.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_26"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] This game version doesn't support search id."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 此游戏版本不支持搜索id."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 此遊戲版本不支援搜索id."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]