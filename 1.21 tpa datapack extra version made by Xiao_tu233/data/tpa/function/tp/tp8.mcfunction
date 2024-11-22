execute as @s[scores={back=1}] run function tpa:back
tp @s @p[scores={player_id=8}]
execute as @s[scores={language=0}] run tellraw @s ["[§bTPA§r] Teleported you to ",{"selector":"@p[scores={player_id=8}]"}]
execute as @s[scores={language=1}] run tellraw @s ["[§bTPA§r] 传送你至 ",{"selector":"@p[scores={player_id=8}]"}]
execute as @s[scores={language=2}] run tellraw @s ["[§bTPA§r] 傳送你至 ",{"selector":"@p[scores={player_id=8}]"}]

scoreboard players set @p[scores={player_id=8}] accept 0
scoreboard players set @s tp_to 0