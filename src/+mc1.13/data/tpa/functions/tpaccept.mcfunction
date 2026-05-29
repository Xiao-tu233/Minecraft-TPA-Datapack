scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0

scoreboard players operation #reqer_id tpa.variables = @s tpa.tpaccept
function tpa:reqer_test

execute if score #is_reqer_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_reqer_found tpa.variables matches 0 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "没有需要处理的请求"}, ". "]
execute if score #is_reqer_found tpa.variables matches 0 run title @s[scores={tpa.output_=0..1}] subtitle [{"text": "没有需要处理的请求"}]

execute if score #is_reqer_found tpa.variables matches 1..2 run function tpa:sounds/tp
execute if score #is_reqer_found tpa.variables matches 1..2 as @p[tag=to_modify] run function tpa:sounds/tp

execute if score #is_reqer_found tpa.variables matches 1 as @p[tag=to_modify] run function tpa:back/push_confirm
execute if score #is_reqer_found tpa.variables matches 1 run tp @p[tag=to_modify] @s
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你接受了"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你所接受传送请求的玩家"}}}, {"text": "的传送请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 1 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你接受了", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的传送请求", "color": "gold"} ]
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "正在传送你至"}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b接受了你的传送请求的玩家"}}}, {"text": "..."}]
execute if score #is_reqer_found tpa.variables matches 1 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "正在传送你至", "color": "gold"}, {"selector":"@s"}, {"text": "...", "color": "gold"} ]

execute if score #is_reqer_found tpa.variables matches 2 run function tpa:back/push_confirm
execute if score #is_reqer_found tpa.variables matches 2 run tp @s @p[tag=to_modify]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @s[scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "你接受了"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"text": "§b你所接受§l传送此处§r请求的玩家"}}}, {"text": "的§l传送此处§r请求"}, ". " ]
execute if score #is_reqer_found tpa.variables matches 2 run title @s[scores={tpa.output_=0..1}] actionbar [{"text": "你接受了", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"text": "的§l传送此处§r请求", "color": "gold"} ]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @p[tag=to_modify, scores={tpa.output_=1..2}] [{"text": "[§bTPA§r] "}, {"text": "正在传送"}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"text": "§b接受了你的§l传送此处§r请求的玩家"}}}, {"text": "至你..."} ]
execute if score #is_reqer_found tpa.variables matches 2 run title @p[tag=to_modify, scores={tpa.output_=0..1}] actionbar [{"text": "正在传送", "color": "gold"}, {"selector":"@s"}, {"text": "至你...", "color": "gold"} ]

scoreboard players set @p[tag=to_modify] tpa.tp_to 0
scoreboard players set @p[tag=to_modify] tpa.tp_here 0
tag @a remove to_modify

