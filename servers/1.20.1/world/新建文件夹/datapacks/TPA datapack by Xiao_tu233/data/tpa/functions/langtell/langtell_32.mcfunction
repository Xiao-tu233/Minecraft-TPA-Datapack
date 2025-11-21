#> tpa:langtell/langtell_32.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_32"
playsound minecraft:ui.button.click ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You disabled always-accept."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你关闭了自动接受."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你關閉了自动接受."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>."]