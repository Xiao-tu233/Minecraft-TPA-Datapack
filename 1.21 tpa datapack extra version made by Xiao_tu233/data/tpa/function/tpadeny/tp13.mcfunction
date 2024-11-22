execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r]  ",{"selector":"@p[scores={player_id=13}]"}," denied your request."]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r]  ",{"selector":"@p[scores={player_id=13}]"}," 拒绝了你的请求."]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r]  ",{"selector":"@p[scores={player_id=13}]"}," 拒絕了你的請求"]

scoreboard players set @s tp_to 0