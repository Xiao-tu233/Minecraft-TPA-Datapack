execute as @s[scores={tpa.book=2}] at @s as @e[type=item, name='Written Book', distance=..2] if data entity @s Item.components."minecraft:custom_data".isTpaBook run kill @s
execute if score #back tpa.config matches 0 run function tpa:back/death
scoreboard players set @a tpa.if_death 0