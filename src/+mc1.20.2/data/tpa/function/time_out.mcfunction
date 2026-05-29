function tpa:load_lang

scoreboard players operation #recver_id tpa.variables = @s tpa.tp_to
execute store result score #is_recver_found tpa.variables run function tpa:recver_test
execute if score #is_recver_found tpa.variables matches 0 if score #debug_mode tpa.config matches 1 run tellraw @a ["[§bTPA§r] §6 Debug: §c", {selector: "@s"}, " has run out of his request time, however the receiver was not found."]

execute if score #is_recver_found tpa.variables matches 1..2 run function tpa:sounds/no
execute if score #is_recver_found tpa.variables matches 1..2 \
    run tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_timeout_left_part"}, \
        {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_timeout_hoverevent"}}}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_timeout_right_part"}, ". " \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run title @s[predicate=tpa:output/show_actionbar] actionbar [\
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_timeout_left_part", color: "gold"}, \
        {selector:"@p[tag=to_modify]"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_timeout_right_part", color: "gold"} \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_timeout_left_part"}, \
        {selector:"@s",hover_event:{action:"show_text",value:{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_timeout_hoverevent"}}}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_timeout_right_part"}, ". " \
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [\
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_timeout_left_part", color: "gold"}, \
        {selector:"@s"}, \
        {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.recver_timeout_right_part", color: "gold"} \
    ]
tag @a remove to_modify
scoreboard players set @s tpa.tp_here 0
scoreboard players set @s tpa.tp_to 0
scoreboard players set @s tpa.req_timer 0