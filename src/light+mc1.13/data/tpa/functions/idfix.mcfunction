scoreboard players set @s tpa.idfix 0
scoreboard players set #global_current tpa.player_id 1
tellraw @a ["[§bTPA§r] ",{"selector":"@s","color":"aqua","hoverEvent":{"action":"show_text","value":"§b这名玩家使用了ID修复"}},"使用了§aID修复§r, 所有玩家的数据包ID与上一位置已被重置."]

scoreboard players set @a tpa.player_id 0