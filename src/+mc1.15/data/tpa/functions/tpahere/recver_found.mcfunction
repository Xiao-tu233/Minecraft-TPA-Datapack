scoreboard players operation @s tpa.tp_to = #tp_here tpa.variables
scoreboard players operation @s tpa.req_timer = #time_out tpa.config
scoreboard players set @s tpa.tp_here 1

execute as @p[tag=to_modify] run function tpa:sounds/pick_orb
tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_tpahere_chatbar_left_part"}, {"selector":"@s","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_tpahere_hoverevent"}}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_tpahere_chatbar_right_part"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_button_accept", "clickEvent": {"action":"run_command", "value":"/trigger tpa.tpaccept set 1"}, "hoverEvent":{"action":"show_text", "value":{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_button_accept_hoverevent"}}}, " ", {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_button_deny", "clickEvent": {"action":"run_command", "value":"/trigger tpa.tpaccept set -1"}, "hoverEvent":{"action":"show_text", "value":{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_button_deny_hoverevent"}}}]
title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [{"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_tpahere_actionbar_left_part", "color": "gold"}, {"selector":"@s"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.recver_recv_tpahere_actionbar_right_part", "color": "gold"} ]

execute if score #condition tpa.variables matches 0 run function tpa:tpahere/first_req
execute if score #condition tpa.variables matches 5 run function tpa:tpahere/change_recver