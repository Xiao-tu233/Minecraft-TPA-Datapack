scoreboard players operation #reqer_id tpa.variables = @s tpa.tpaccept
scoreboard players operation #reqer_id tpa.variables *= #-1 tpa.variables
scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0
function tpa:reqer_test

execute if score #is_reqer_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_reqer_found tpa.variables matches 0 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "没有需要处理的请求"}, ". "]
execute if score #is_reqer_found tpa.variables matches 0 run title @s[scores={tpa.output_=0..1}] subtitle [{"text": "没有需要处理的请求"}]

execute if score #is_reqer_found tpa.variables matches 1..2 run function tpa:sounds/click
execute if score #is_reqer_found tpa.variables matches 1..2 as @p[tag=to_modify] run function tpa:sounds/no

execute if score #is_reqer_found tpa.variables matches 1 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你拒绝了"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你所拒绝传送请求的玩家"}}}, {"text": "的传送请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 1 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你拒绝了", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的传送请求", "color": "gold"} ]
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b拒绝了你的传送请求的玩家"}}}, {"text": "拒绝了你的传送请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 1 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector":"@s"}, {"text": "拒绝了你的传送请求", "color": "gold"} ]

execute if score #is_reqer_found tpa.variables matches 2 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你拒绝了"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你所拒绝§l传送此处§r请求的玩家"}}}, {"text": "的§l传送此处§r请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 2 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你拒绝了", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的§l传送此处§r请求", "color": "gold"} ]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": ""}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b拒绝了你的§l传送此处§r请求的玩家"}}}, {"text": "拒绝了你的传送请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 2 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "", "color": "gold"}, {"selector":"@s"}, {"text": "拒绝了你的传送请求", "color": "gold"} ]

execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_to 0
execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_here 0
tag @a remove to_modify

