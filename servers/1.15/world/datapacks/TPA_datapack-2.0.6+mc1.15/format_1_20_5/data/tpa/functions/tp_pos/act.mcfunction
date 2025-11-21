

scoreboard players operation @s tpa.pos_cd = #tp_pos_cooldown tpa.config
function tpa:sounds/tp
tellraw @s[scores={tpa.output=1..2}] [{"storage": "tpa:tpa", "nbt": "temp.lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_left_part"}, \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[1]"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[2]"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[3]"}, \
    {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_right_part"}, "."]
title @s[scores={tpa.output=0..1}] actionbar [\
    {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_left_part"}, \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[1]"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[2]"}, " ", \
    {"storage": "tpa:tpa", "nbt": "temp.key_commands[-1].commands[3]"},\
    {"storage": "tpa:tpa", "nbt": "temp.lang.tp_pos_act_right_part"}\
]
function tpa:back/store_pos
$tp @s $(x) $(y) $(z)