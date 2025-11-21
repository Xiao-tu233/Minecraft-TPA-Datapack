#> tpa:langtell/langtell_51.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_51"
playsound minecraft:ui.button.click ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You unmuted datapack sounds."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你开启了数据包音效."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你開啟了資料包音效."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>."]