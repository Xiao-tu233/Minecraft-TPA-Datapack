# Parent function: tpa:warp
# @macro: {dim: str, x: int, y: int, z: int}
function tpa:back/set
$execute in $(dim) run tp @s $(x) $(y) $(z)
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_left_part"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.warp.name", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.warp.desc"}}}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_right_part"}, ". " \
]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_left_part", color: "gold"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.warp.name", color: "gold"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_right_part", color: "gold"}\
]