

scoreboard players operation @s tpa.pos_cd = #tp_pos_cooldown tpa.config
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_act_left_part"}, \
    {"score": {"objective": "tpa.pos.x_temp", "name": "@s"}}, " ", \
    {"score": {"objective": "tpa.pos.y_temp", "name": "@s"}}, " ", \
    {"score": {"objective": "tpa.pos.z_temp", "name": "@s"}}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_act_right_part"}, "."]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_act_left_part"}, \
    {"score": {"objective": "tpa.pos.x_temp", "name": "@s"}}, " ", \
    {"score": {"objective": "tpa.pos.y_temp", "name": "@s"}}, " ", \
    {"score": {"objective": "tpa.pos.z_temp", "name": "@s"}},\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tp_pos_act_right_part"}\
]
function tpa:back/set
$tp @s $(x) $(y) $(z)