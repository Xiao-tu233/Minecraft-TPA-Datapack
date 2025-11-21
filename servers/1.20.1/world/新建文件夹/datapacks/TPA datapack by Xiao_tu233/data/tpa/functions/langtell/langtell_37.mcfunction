#> tpa:langtell/langtell_37.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_37"
playsound minecraft:entity.enderman.teleport ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] Since you enabled always-accept, you accepted the tp request."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 由于你开启了自动接受, 你接受了传送请求."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 由於你開啟了自動接受, 你接受了傳送請求."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>"]