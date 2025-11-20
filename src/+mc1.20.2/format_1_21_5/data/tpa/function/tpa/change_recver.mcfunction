
# tpa_change: the code here may be really messed up. Regardless, all you need to know what'll be done is that:
#     1. tell the requester the ex-recver and the recver now; 
#     2. tell the ex-recver that the request has been cancelled; 
#     3. tell the recver that he's been requested.

function tpa:sounds/click
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_chatbar_left_part"}, {selector: "@p[tag=temp_modify]", hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_hoverevent"}}},  {storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_chatbar_middle_part"}, {selector: "@p[tag=to_modify]", hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_tpa_hoverevent"}}},  {storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_chatbar_right_part"}, " ", {storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_button_cancel", click_event: {action:"run_command", command:"/trigger tpa.cancel_req"}, hover_event:{action:"show_text", value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_button_cancel_hoverevent"}}}]
title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_actionbar_left_part", color: "gold"}, {selector: "@p[tag=to_modify]"},  {storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_actionbar_middle_part", color: "gold"}, {selector: "@p[tag=temp_modify]"},  {storage:"tpa:tpa", nbt:"loaded_lang.reqer_change_actionbar_right_part", color: "gold"} ]

function tpa:sounds/no
tellraw @p[tag=temp_modify, predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_left_part"}, {selector: "@s", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.recver_cancel_hoverevent"}}},  {storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_right_part"}, ". " ]
title @p[tag=temp_modify, predicate=tpa:output/show_actionbar] subtitle [{storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_left_part", color: "gold"}, {selector: "@s"}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_cancel_right_part", color: "gold"}]
