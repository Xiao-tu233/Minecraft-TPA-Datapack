#> tpa:langtell/langtell_35.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_35"
playsound minecraft:entity.villager.no ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§bThe one who denied your tp request"}}," denied your tp request."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b拒绝了你的传送请求的玩家"}}," 拒绝了你的传送请求."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] ",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b拒绝了你的傳送請求的玩家"}}," 拒絕了你的傳送請求."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b<Text here>"}},"<Text here>"]