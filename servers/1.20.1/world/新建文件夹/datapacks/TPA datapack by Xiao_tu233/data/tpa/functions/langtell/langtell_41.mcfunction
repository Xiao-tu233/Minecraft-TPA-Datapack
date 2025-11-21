#> tpa:langtell/langtell_41.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_41"
playsound minecraft:ui.button.click ambient @s[scores={mute=0}] ~ ~ ~ 1 0.1
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] This server haven't enabled ifAllowPlayerToDoBack."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 服务器未启用back功能."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 伺服器未啟用back功能."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]
scoreboard players set @s back 0