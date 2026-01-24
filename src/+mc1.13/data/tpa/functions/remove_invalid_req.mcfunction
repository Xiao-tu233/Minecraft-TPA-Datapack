scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.req_timer 0

function tpa:sounds/no
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你请求的玩家已离线或不允许被传送"}, ". "]
title @s[scores={tpa.output_=0..1}] actionbar {"text": "你请求的玩家已离线或不允许被传送", "color": "red"}