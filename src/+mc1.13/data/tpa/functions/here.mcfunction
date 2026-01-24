scoreboard players set @s tpa.here 0
function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§a广播坐标§r不兼容该游戏版本"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§a广播坐标§r不兼容该游戏版本", "color":"red"}]
