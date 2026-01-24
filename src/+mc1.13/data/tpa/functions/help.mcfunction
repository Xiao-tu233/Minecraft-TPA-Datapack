execute if score @s tpa.help matches 0 run scoreboard players set @s tpa.help 1
tellraw @s "帮助菜单不再维护了 请见Github用户文档"
scoreboard players set @s tpa.help 0