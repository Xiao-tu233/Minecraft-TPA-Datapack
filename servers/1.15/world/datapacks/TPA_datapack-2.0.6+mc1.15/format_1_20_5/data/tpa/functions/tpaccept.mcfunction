scoreboard players operation #reqer_id tpa.variables = @s tpa.tpaccept
scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0
execute store result score #is_reqer_found tpa.variables run function tpa:reqer_test

function tpa:load_lang

execute if score #is_reqer_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_reqer_found tpa.variables matches 0 \
    run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, {"storage":"tpa:tpa", "nbt":"temp.lang.recver_req_not_exist"}, ". "]
execute if score #is_reqer_found tpa.variables matches 0 \
    run title @s[scores={tpa.output=0..1}] subtitle [{"storage":"tpa:tpa", "nbt":"temp.lang.recver_req_not_exist"}]

execute if score #is_reqer_found tpa.variables matches 1..2 run function tpa:sounds/tp
execute if score #is_reqer_found tpa.variables matches 1..2 as @p[tag=to_modify] run function tpa:sounds/tp
execute if score #is_reqer_found tpa.variables matches 1 as @p[tag=to_modify] run function tpa:back/store_pos
execute if score #is_reqer_found tpa.variables matches 1 run tp @p[tag=to_modify] @s
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpa_left_part"}, \
        {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpa_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpa_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 1 run title @s[scores={tpa.output=0..1}] actionbar [\
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpa_left_part", "color": "gold"}, \
        {"selector":"@p[tag=to_modify]"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpa_right_part", "color": "gold"} \
    ]
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @p[tag=to_modify, scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpa_left_part"}, \
        {"selector":"@s","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpa_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpa_right_part"}\
    ]
execute if score #is_reqer_found tpa.variables matches 1 run title @p[tag=to_modify, scores={tpa.output=0..1}] actionbar [\
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpa_left_part", "color": "gold"}, \
        {"selector":"@s"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpa_right_part", "color": "gold"} \
    ]

execute if score #is_reqer_found tpa.variables matches 2 run function tpa:back/store_pos
execute if score #is_reqer_found tpa.variables matches 2 run tp @s @p[tag=to_modify]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @s[scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpahere_left_part"}, \
        {"selector":"@p[tag=to_modify]","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpahere_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpahere_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run title @s[scores={tpa.output=0..1}] actionbar [\
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpahere_left_part", "color": "gold"}, \
        {"selector":"@p[tag=to_modify]"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.recver_accept_tpahere_right_part", "color": "gold"} \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @p[tag=to_modify, scores={tpa.output=1..2}] [{"storage":"tpa:tpa", "nbt":"temp.lang.header"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpahere_left_part"}, \
        {"selector":"@s","hoverEvent":{"action":"show_text","value":{"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpahere_hoverevent"}}}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpahere_right_part"} \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run title @p[tag=to_modify, scores={tpa.output=0..1}] actionbar [\
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpahere_left_part", "color": "gold"}, \
        {"selector":"@s"}, \
        {"storage":"tpa:tpa", "nbt":"temp.lang.reqer_accept_tpahere_right_part", "color": "gold"} \
    ]

execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_to 0
execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_here 0
tag @a remove to_modify

