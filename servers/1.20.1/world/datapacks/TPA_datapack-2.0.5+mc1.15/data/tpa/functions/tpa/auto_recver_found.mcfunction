
execute as @p[tag=to_modify] run function tpa:sounds/tp
tellraw @p[tag=to_modify, scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_auto_left_part"}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_auto_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_auto_right_part"}, ". " ]
title @p[tag=to_modify, scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_auto_left_part", "color": "gold"}, {"selector":"@s"}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_auto_right_part", "color": "gold"} ]

function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_auto_left_part"}, {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_auto_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_auto_right_part"}, ". " ]
title @s[scores={tpa.output=0..1}] actionbar [{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_auto_left_part", "color": "gold"}, {"selector":"@p[tag=to_modify]"}, {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_auto_right_part", "color": "gold"} ]

function tpa:back/push_confirm
tp @s @p[tag=to_modify]
scoreboard players set @s tpa.tp_to 0

execute if score #condition tpa.variables matches 5 run function tpa:tpa/change_recver