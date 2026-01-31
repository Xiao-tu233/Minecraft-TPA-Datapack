scoreboard players set @s tpa.cancel_req 0
function tpa:load_lang

scoreboard players operation #recver_id tpa.variables = @s tpa.tp_to
execute store result score #is_recver_found tpa.variables run function tpa:recver_test

execute if score #is_recver_found tpa.variables matches 0 run function tpa:sounds/no
execute if score #is_recver_found tpa.variables matches 0 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_no_req_found"}, ". " \
    ]
execute if score #is_recver_found tpa.variables matches 0 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_no_req_found", color: "gold"} \
    ]

execute if score #is_recver_found tpa.variables matches 1..2 run function tpa:sounds/click
execute if score #is_recver_found tpa.variables matches 1..2 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_left_part"}, \
        {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_hoverevent"}}}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_right_part"}, ". " \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_left_part", color: "gold"}, \
        {selector:"@p[tag=to_modify]"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_cancel_right_part", color: "gold"} \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_left_part"}, \
        {selector:"@s",hover_event:{action:"show_text",value:{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_hoverevent"}}}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_right_part"}, ". " \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [\
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_left_part", color: "gold"}, \
        {selector:"@s"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_right_part", color: "gold"} \
    ]
tag @a remove to_modify
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.req_timer 0