scoreboard players set @s tpa.search_id 0
function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§a搜索ID§r不兼容该游戏版本"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§a搜索ID§r不兼容该游戏版本", "color":"red"}]