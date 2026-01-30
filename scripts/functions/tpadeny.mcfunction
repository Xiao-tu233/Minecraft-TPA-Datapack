scoreboard players operation #reqer_id tpa.variables = @s tpa.tpaccept
scoreboard players operation #reqer_id tpa.variables *= #-1 tpa.variables
scoreboard players set @s tpaccept 0
scoreboard players set @s tpa.tpaccept 0
execute store result score #is_reqer_found tpa.variables run function tpa:reqer_test

function tpa:load_lang

execute if score #is_reqer_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_reqer_found tpa.variables matches 0 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_req_not_exist"}, ". "]
execute if score #is_reqer_found tpa.variables matches 0 \
    run title @s[predicate=tpa:output/show_actionbar] subtitle [{storage:"tpa:tpa", nbt:"loaded_lang.recver_req_not_exist"}]

execute if score #is_reqer_found tpa.variables matches 1..2 run function tpa:sounds/click
execute if score #is_reqer_found tpa.variables matches 1..2 as @p[tag=to_modify] run function tpa:sounds/no
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpa_left_part"}, \
        {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpa_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpa_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpa_left_part", color: "gold"}, \
        {selector:"@p[tag=to_modify]"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpa_right_part", color: "gold"} \
    ]
execute if score #is_reqer_found tpa.variables matches 1 run tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpa_left_part"}, \
        {selector:"@s",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpa_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpa_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 1 run title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpa_left_part", color: "gold"}, \
        {selector:"@s"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpa_right_part", color: "gold"} \
    ]

execute if score #is_reqer_found tpa.variables matches 2 run tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpahere_left_part"}, \
        {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpahere_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpahere_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpahere_left_part", color: "gold"}, \
        {selector:"@p[tag=to_modify]"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.recver_deny_tpahere_right_part", color: "gold"} \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpahere_left_part"}, \
        {selector:"@s",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpahere_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpahere_right_part"}, ". " \
    ]
execute if score #is_reqer_found tpa.variables matches 2 run title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [\
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpahere_left_part", color: "gold"}, \
        {selector:"@s"}, \
        {storage:"tpa:tpa", nbt:"loaded_lang.reqer_deny_tpahere_right_part", color: "gold"} \
    ]

execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_to 0
execute if score #is_reqer_found tpa.variables matches 1..2 run scoreboard players set @p[tag=to_modify] tpa.tp_here 0
tag @a remove to_modify

