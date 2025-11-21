#> tpa:langtell/langtell_36.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_36"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You denied the tp request."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你拒绝了传送请求."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你拒絕了傳送請求."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]