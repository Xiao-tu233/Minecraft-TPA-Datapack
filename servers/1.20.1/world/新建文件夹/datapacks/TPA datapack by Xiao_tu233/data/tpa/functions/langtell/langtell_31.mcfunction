#> tpa:langtell/langtell_31.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_31"
playsound minecraft:ui.button.click ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You enabled always-accept."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你开启了自动接受."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你開啟了自动接受."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>."]