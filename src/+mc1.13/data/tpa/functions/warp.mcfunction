scoreboard players set @s tpa.warp 0

function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§a公共传送点§r不兼容该游戏版本"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§a公共传送点§r不兼容该游戏版本", "color":"red"}]
