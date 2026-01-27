execute if score @s tpa matches 1.. run scoreboard players operation #tp_to tpa = @s tpa
scoreboard players set @s tpa 0
execute if score @s tpa.tpa matches 1.. run scoreboard players operation #tp_to tpa = @s tpa.tpa
scoreboard players set @s tpa.tpa 0

scoreboard players set #condition tpa 0

execute if score #tp_to tpa matches 1 run function tpa:tpa_menu
execute if score #condition tpa matches 0 if score #tp_to tpa = @s tpa.player_id run function tpa:tpa_self

execute if score #condition tpa matches 0 run function tpa:recver_test
execute if score #is_recver_found tpa matches 1 run tellraw @p[tag=to_modify] ["[§bTPA§r] ",{"selector":"@s","hoverEvent":{"action":"show_text","value":"§b向你发送了请求"}},"传送到了你这里"]
execute if score #is_recver_found tpa matches 1 run tellraw @s ["[§bTPA§r] 传送你至",{"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":"§b你传送的玩家"}},"..."]
execute if score #is_recver_found tpa matches 1 run tp @s @p[tag=to_modify]
tag @a remove to_modify