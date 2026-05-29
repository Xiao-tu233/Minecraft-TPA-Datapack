# tpa.lang_temp is dummy while tpa.language is trigger
scoreboard players set @s tpa.language 0

function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "§a语言§r不兼容该游戏版本"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "§a语言§r不兼容该游戏版本", "color":"red"}]