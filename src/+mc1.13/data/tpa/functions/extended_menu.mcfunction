
scoreboard players set @s tpa.ext_menu 0
function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§a展开菜单§r不兼容此游戏版本"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§a展开菜单§r不兼容此游戏版本", "color":"red"}]