# Parent function: tpa:tp_pos\detect

scoreboard players operation @s tpa.pos_cd = #tp_pos_cooldown tpa.config
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_act_left_part"}, \
    {score: {objective: "tpa.pos.x_temp", name: "@s"}}, " ", \
    {score: {objective: "tpa.pos.y_temp", name: "@s"}}, " ", \
    {score: {objective: "tpa.pos.z_temp", name: "@s"}}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_act_right_part"}, "."]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_act_left_part"}, \
    {score: {objective: "tpa.pos.x_temp", name: "@s"}}, " ", \
    {score: {objective: "tpa.pos.y_temp", name: "@s"}}, " ", \
    {score: {objective: "tpa.pos.z_temp", name: "@s"}},\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tp_pos_act_right_part"}\
]
function tpa:back/set
data remove storage tpa:tpa temp.teleport
data modify storage tpa:tpa temp.teleport.Pos set value [0.0d, 0.0d, 0.0d]
data modify storage tpa:tpa temp.teleport.Rotation set value [0.0f, 0.0f]
data modify storage tpa:tpa temp.teleport.Pos[0] set from storage tpa:tpa temp.args.x
data modify storage tpa:tpa temp.teleport.Pos[1] set from storage tpa:tpa temp.args.y
data modify storage tpa:tpa temp.teleport.Pos[2] set from storage tpa:tpa temp.args.z
data modify storage tpa:tpa temp.args.id set from entity @s Dimension
function tpa:dimension/get
data modify storage tpa:tpa temp.teleport.Dimension set from storage tpa:tpa temp.dimension.namespaceid
data modify storage tpa:tpa temp.teleport.Rotation set from entity @s Rotation
function tpa:teleport/main
function tpa:sounds/tp
