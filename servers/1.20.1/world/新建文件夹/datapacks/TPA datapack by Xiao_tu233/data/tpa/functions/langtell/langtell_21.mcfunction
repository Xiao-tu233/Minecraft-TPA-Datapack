#> tpa:langtell/langtell_21.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_21"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You can't teleport to yourself."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你不能tp你自己."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你不能tp你自己."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>."]