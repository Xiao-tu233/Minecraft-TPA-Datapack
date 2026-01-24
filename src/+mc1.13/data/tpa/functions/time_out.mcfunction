scoreboard players operation #recver_id tpa.variables = @s tpa.tp_to
function tpa:recver_test
execute if score #is_recver_found tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §c", {"selector": "@s"}, " has run out of his request time, however the receiver was not found."]
execute if score #is_recver_found tpa.variables matches 1..2 run function tpa:sounds/no
execute if score #is_recver_found tpa.variables matches 1..2 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你向"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b未接受你的请求的玩家"}}}, {"text": "的传送请求已超时"}, ". " ]
execute if score #is_recver_found tpa.variables matches 1..2 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你向", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的传送请求已超时", "color": "gold"} ]
execute if score #is_recver_found tpa.variables matches 1..2 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b向你发送超时请求的玩家"}}}, {"text": "的传送请求已超时"}, ". " ]
execute if score #is_recver_found tpa.variables matches 1..2 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector":"@s"}, {"text": "的传送请求已超时", "color": "gold"} ]
tag @a remove to_modify
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tp_to 0