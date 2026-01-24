
# tpa_change: the code here may be really messed up. Regardless, all you need to know what'll be done is that:
#     1. tell the requester the ex-recver and the recver now; 
#     2. tell the ex-recver that the request has been cancelled; 
#     3. tell the recver that he's been requested.

function tpa:sounds/click
tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你之前发送过了一个向"}, {"selector": "@p[tag=temp_modify]", "hoverEvent":{"action":"show_text","value":{"text": "§b你之前发送请求的玩家"}}},  {"text": "的请求, 已取消前一个请求. 现在向"}, {"selector": "@p[tag=to_modify]", "hoverEvent":{"action":"show_text","value":{"text": "§b你所发送传送请求的玩家"}}},  {"text": "发送了请求, 等待他接受"}, " ", {"text": "[§4取消§r]", "clickEvent": {"action":"run_command", "value":"/trigger tpa.cancel_req"}, "hoverEvent":{"action":"show_text", "value":{"text": "§b点击取消请求"}}}]
title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你之前发送过了一个向", "color": "gold"}, {"selector": "@p[tag=to_modify]"},  {"text": "的请求, 已取消前一个请求. 现在向", "color": "gold"}, {"selector": "@p[tag=temp_modify]"},  {"text": "发送了请求, 等待他接受, 摇头3次以取消请求", "color": "gold"} ]

function tpa:sounds/no
tellraw @p[tag=temp_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector": "@s", "hoverEvent": {"action": "show_text", "value": {"text": "§b取消对你请求的玩家"}}},  {"text": "取消了对你的请求"}, ". " ]
title @p[tag=temp_modify, scores={tpa.output_=0..1}] subtitle [{"text": "", "color": "gold"}, {"selector": "@s"}, {"text": "取消了对你的请求", "color": "gold"}]
