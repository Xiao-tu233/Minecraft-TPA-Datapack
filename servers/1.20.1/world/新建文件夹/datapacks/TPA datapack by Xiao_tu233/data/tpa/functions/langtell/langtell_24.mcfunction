#> tpa:langtell/langtell_24.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_24"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] This game version doesn't support tpamenu."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 此游戏版本不支持tpa菜单."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 此遊戲版本不支援tpa选单."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]