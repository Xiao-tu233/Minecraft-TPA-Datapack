function tpa:sounds/pick_orb
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你向"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你所发送传送请求的玩家"}}}, {"text": "发送了一个传送请求. 等待他接受"}, " ", {"text": "[§4取消§r]", "clickEvent": {"action":"run_command", "value":"/trigger tpa.cancel_req"}, "hoverEvent":{"action":"show_text", "value":{"text": "§b点击取消请求"}}}]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你向", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "发送了一个传送请求. 等待他接受, 摇头3次以取消请求", "color": "gold"} ]
