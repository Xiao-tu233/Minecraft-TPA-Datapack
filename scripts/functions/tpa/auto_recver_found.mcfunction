
execute as @p[tag=to_modify] run function tpa:sounds/tp
tellraw @p[tag=to_modify, predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_auto_left_part"}, {selector:"@s",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_auto_hoverevent"}}}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_auto_right_part"}, ". " ]
title @p[tag=to_modify, predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_auto_left_part", color: "gold"}, {selector:"@s"}, {storage:"tpa:tpa", nbt:"loaded_lang.recver_accept_auto_right_part", color: "gold"} ]

function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_accept_auto_left_part"}, {selector:"@p[tag=to_modify]",hover_event:{action:"show_text",value:{storage:"tpa:tpa", nbt:"loaded_lang.reqer_accept_auto_hoverevent"}}}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_accept_auto_right_part"}, ". " ]
title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_accept_auto_left_part", color: "gold"}, {selector:"@p[tag=to_modify]"}, {storage:"tpa:tpa", nbt:"loaded_lang.reqer_accept_auto_right_part", color: "gold"} ]

function tpa:back/set
tp @s @p[tag=to_modify]
scoreboard players set @s tpa.tp_to 0

execute if score #condition tpa.variables matches 5 run function tpa:tpa/change_recver