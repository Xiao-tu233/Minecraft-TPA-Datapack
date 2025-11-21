#> tpa:langtell/langtell_3b.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_3b"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] Your tp request to ",{"selector":"@a[tag=to_modify]"}," is timed out."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你向",{"selector":"@a[tag=to_modify]"},"发送的传送请求已过期."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你向",{"selector":"@a[tag=to_modify]"},"發送的傳送請求已過期."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>",{"selector":"@a[tag=to_modify]"},"<Text here>"]