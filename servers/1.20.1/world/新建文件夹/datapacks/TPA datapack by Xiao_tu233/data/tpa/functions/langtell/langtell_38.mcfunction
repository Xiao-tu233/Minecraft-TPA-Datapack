#> tpa:langtell/langtell_38.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_38"
playsound minecraft:entity.enderman.teleport ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] You sent a teleport request to ", {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":"§bthe one you sent tpa request to"}}, ". Since he enabled always-accept, you were teleported "]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 你向",{"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":"§b你发送传送申请的玩家"}},"发送了一个传送请求. 由于他开启了自动接受, 所以你被传送到他这里. "]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 你向",{"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":"§b你發送傳送申請的玩家"}},"發送了一個傳送請求. 由于他開啟了自動接受, 所以你被傳送到他這裡. "]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>",{"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":"§b<Text here>"}},"<Text here> "]
