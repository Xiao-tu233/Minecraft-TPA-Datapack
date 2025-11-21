#> tpa:langtell/langtell_64.mcfunction
execute if score #debug_mode tpa_config matches 1 run tellraw @a "[§bTPA§r] §6 Debug: §rNow executing: §atpa:langtell/langtell_64"
playsound minecraft:entity.enderman.teleport ambient @s[scores={mute=0}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] Teleporting ",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§bThe one who accepted your tp request"}}," to you..."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 正在传送你",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b同意了你的传送请求的玩家"}},"至你..."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 正在傳送",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b同意了你的傳送請求的玩家"}},"至你..."]
execute as @s[scores={language=3}] run tellraw @s ["[§bTPA§r] <Text here>. ",{"selector":"@p[tag=self]","hoverEvent":{"action":"show_text","value":"§b<Text here>"}},"<Text here>"]