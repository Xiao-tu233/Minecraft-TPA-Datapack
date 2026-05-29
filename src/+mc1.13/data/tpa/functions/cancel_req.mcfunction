scoreboard players set @s tpa.cancel_req 0

scoreboard players operation #recver_id tpa.variables = @s tpa.tp_to
function tpa:recver_test

execute if score #is_recver_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_recver_found tpa.variables matches 0 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你还未向玩家发送任何请求"}, ". " ]
execute if score #is_recver_found tpa.variables matches 0 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你还未向玩家发送任何请求", "color": "gold"} ]

execute if score #is_recver_found tpa.variables matches 1..2 run function tpa:sounds/click
execute if score #is_recver_found tpa.variables matches 1..2 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你取消了向"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你取消了请求的玩家"}}}, {"text": "的请求"}, ". " ]
execute if score #is_recver_found tpa.variables matches 1..2 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你取消了向", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的请求", "color": "gold"} ]
execute if score #is_recver_found tpa.variables matches 1..2 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b取消对你请求的玩家"}}}, {"text": "取消了对你的请求"}, ". " ]
execute if score #is_recver_found tpa.variables matches 1..2 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector":"@s"}, {"text": "取消了对你的请求", "color": "gold"} ]
tag @a remove to_modify
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.req_timer 0