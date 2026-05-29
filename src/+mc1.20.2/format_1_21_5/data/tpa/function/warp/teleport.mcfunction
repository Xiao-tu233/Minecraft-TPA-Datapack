# Parent function: tpa:warp
# @macro: {dim: str, x: int, y: int, z: int}
function tpa:back/set
$execute in $(dim) run tp @s $(x) $(y) $(z)
function tpa:sounds/tp
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_left_part"}, \
    {storage: "tpa:tpa", nbt: "temp.warp.name", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "temp.warp.desc"}}}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_right_part"}, ". " \
]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_left_part", color: "gold"}, \
    {storage: "tpa:tpa", nbt: "temp.warp.name", color: "gold"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_teleport_right_part", color: "gold"}\
]