function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "请求的玩家不存在或不在线"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "请求的玩家不存在或不在线", "color": "red"}]