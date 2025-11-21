scoreboard players operation #tp_here tpa.variables = @s tpa.tpahere
scoreboard players set @s tpa.tpahere 0

function tpa:load_lang

execute if score #tp_here tpa.variables matches 1 run function tpa:tpahere_menu
execute if score #tp_here tpa.variables matches 1 run return 0

function tpa:tpa_condition_dealing
execute if score #condition tpa.variables matches 1..4 run return 0

execute if score #condition tpa.variables matches 5 run function tpa:tpa_change
# @p[tag=temp_modify] -> receiver requested last time (tpa.tp_here)
scoreboard players operation #recver_id tpa.variables = #tp_here tpa.variables
execute store result score #is_recver_found tpa.variables run function tpa:recver_test
# @p[tag=to_modify] -> receiver requested new (tpa.tpa, tpa.tpahere)

scoreboard players set #if_change tpa.variables 0
scoreboard players set #is_first_req tpa.variables 0
execute if score #condition tpa.variables matches 5 if score #is_recver_found tpa.variables matches 1..2 \
    run scoreboard players set #if_change tpa.variables 1
execute if score #condition tpa.variables matches 0 if score #is_recver_found tpa.variables matches 1..2 \
    run scoreboard players set #is_first_req tpa.variables 1

# ------ tpa_change ------
execute if score #if_change tpa.variables matches 1 run function tpa:sounds/click
execute if score #if_change tpa.variables matches 1 \
    run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_chatbar_left_part"}, \
        {selector: "@p[tag=temp_modify]", hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"temp.lang.reqer_change_hoverevent"}}},  \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_chatbar_middle_part"}, \
        {selector: "@p[tag=to_modify]", hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpaherehere_hoverevent"}}},  \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_chatbar_right_part"}, " ", \
        {\
            storage:"tpa:tpa", \
            nbt:"temp.lang.reqer_req_button_cancel", \
            click_event: {action:"run_command", command:"/trigger tpa.cancel_req"}, \
            hover_event:{action:"show_text", value:{storage:"tpa:tpa", nbt:"temp.lang.reqer_req_button_cancel_hoverevent"}}\
        }\
    ]
execute if score #if_change tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [\
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_actionbar_left_part", color: "gold"}, \
        {selector: "@p[tag=to_modify]"},  \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_actionbar_middle_part", color: "gold"}, \
        {selector: "@p[tag=temp_modify]"},  \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_change_actionbar_right_part", color: "gold"} \
    ]

# ------ ex-recver ------
execute if score #if_change tpa.variables matches 1 \
    run tellraw @p[tag=temp_modify, scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_cancel_left_part"}, \
        {selector: "@s", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.lang.recver_cancel_hoverevent"}}},  \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_cancel_right_part"}, ". " \
    ]
execute if score #if_change tpa.variables matches 1 \
    run title @p[tag=temp_modify, scores={tpa.output=0..1}] subtitle [\
        {storage:"tpa:tpa", nbt:"temp.lang.recver_cancel_left_part", color: "gold"}, \
        {selector: "@s"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_cancel_right_part", color: "gold"}\
    ]
# ------ END tpa_change ------

execute if score #is_first_req tpa.variables matches 1 as @p[tag=to_modify] run function tpa:sounds/pick_orb
execute if score #is_first_req tpa.variables matches 1 run function tpa:sounds/pick_orb

execute if score #is_recver_found tpa.variables matches 1..2 run scoreboard players operation @s tpa.tp_to = #tp_here tpa.variables
execute if score #is_recver_found tpa.variables matches 1..2 run scoreboard players set @s tpa.tp_here 1
execute if score #is_recver_found tpa.variables matches 1..2 run scoreboard players operation @s tpa.req_timer = #time_out tpa.config

execute if score #is_first_req tpa.variables matches 1 run tellraw @s[scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpahere_chatbar_left_part"}, \
        {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpahere_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpahere_chatbar_right_part"}, " ", \
        {\
            storage:"tpa:tpa", \
            nbt:"temp.lang.reqer_req_button_cancel", \
            click_event: {action:"run_command", command:"/trigger tpa.cancel_req"}, \
            hover_event:{action:"show_text", value:{storage:"tpa:tpa", nbt:"temp.lang.reqer_req_button_cancel_hoverevent"}}\
        }\
    ]
execute if score #is_first_req tpa.variables matches 1 \
    run title @s[scores={tpa.output=0..1}] actionbar [\
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpahere_actionbar_left_part", color: "gold"}, \
        {selector:"@p[tag=to_modify]"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.reqer_req_tpahere_actionbar_right_part", color: "gold"} \
    ]
# ------ recver ------
execute if score #is_recver_found tpa.variables matches 1..2 \
    run tellraw @p[tag=to_modify, scores={tpa.output=1..2}] [{storage:"tpa:tpa", nbt:"temp.lang.header"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_recv_tpahere_chatbar_left_part"}, \
        {selector:"@s",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"temp.lang.recver_recv_tpahere_hoverevent"}}}, \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_recv_tpahere_chatbar_right_part"}, \
        {\
            storage:"tpa:tpa", \
            nbt:"temp.lang.recver_recv_button_accept", \
            click_event: {action:"run_command", command:"/trigger tpa.tpaccept set 1"}, \
            hover_event:{action:"show_text", value:{storage:"tpa:tpa", nbt:"temp.lang.recver_recv_button_accept_hoverevent"}}\
        }, " ", \
        {\
            storage:"tpa:tpa", \
            nbt:"temp.lang.recver_recv_button_deny", \
            click_event: {action:"run_command", command:"/trigger tpa.tpaccept set -1"}, \
            hover_event:{action:"show_text", value:{storage:"tpa:tpa", nbt:"temp.lang.recver_recv_button_deny_hoverevent"}}\
        }\
    ]
execute if score #is_recver_found tpa.variables matches 1..2 \
    run title @p[tag=to_modify, scores={tpa.output=0..1}] actionbar [\
        {storage:"tpa:tpa", nbt:"temp.lang.recver_recv_tpahere_actionbar_left_part", color: "gold"}, \
        {selector:"@s"}, \
        {storage:"tpa:tpa", nbt:"temp.lang.recver_recv_tpahere_actionbar_right_part", color: "gold"} \
    ]
# ------ END recver ------

tag @a remove to_modify
tag @a remove temp_modify
scoreboard players set #tp_here tpa.variables 0