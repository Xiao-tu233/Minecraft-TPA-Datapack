scoreboard players operation @s tpa.tp_to = #tp_to tpa.variables
scoreboard players operation @s tpa.req_timer = #time_out tpa.config
scoreboard players set @s tpa.tp_here 1

execute as @p[tag=to_modify] run function tpa:sounds/pick_orb
tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b向你发送§l传送此处§r请求的玩家"}}}, {"text": "向你发送了一个§l传送此处§r请求"}, {"text": "[§a接受§r]", "clickEvent": {"action":"run_command", "value":"/trigger tpa.tpaccept set 1"}, "hoverEvent":{"action":"show_text", "value":{"text": "§b点击接受他的请求"}}}, " ", {"text": "[§c拒绝§r]", "clickEvent": {"action":"run_command", "value":"/trigger tpa.tpaccept set -1"}, "hoverEvent":{"action":"show_text", "value":{"text": "§b点击拒绝他的请求"}}}]
title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector":"@s"}, {"text": "向你发送了一个§l传送此处§r请求, 点头3次以接受请求, 摇头3次以拒绝请求", "color": "gold"} ]

execute if score #condition tpa.variables matches 0 run function tpa:tpahere/first_req
execute if score #condition tpa.variables matches 5 run function tpa:tpa/change_recver