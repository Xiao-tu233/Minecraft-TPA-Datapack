
execute as @p[tag=to_modify] run function tpa:sounds/tp
tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "自动接受了"}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b向你发送传送请求的玩家"}}}, {"text": "的传送请求"}, ". " ]
title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "自动接受了", "color": "gold"}, {"selector":"@s"}, {"text": "的传送请求", "color": "gold"} ]

function tpa:sounds/tp
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "对方开启了自动接受, 将你传送至"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b自动同意了你的传送请求的玩家"}}}, {"text": "..."}, ". " ]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "对方开启了自动接受, 将你传送至", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "...", "color": "gold"} ]

function tpa:back/push_confirm
tp @s @p[tag=to_modify]
scoreboard players set @s tpa.tp_to 0

execute if score #condition tpa.variables matches 5 run function tpa:tpa/change_recver