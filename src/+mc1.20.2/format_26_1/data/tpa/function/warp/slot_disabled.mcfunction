# Parent functin: tpa:warp
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [\
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"},\
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_leftpart"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.warp.name"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_rightpart"}, \
    ". "\
    ]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_leftpart", color: "red"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"temp.warp.name", color: "red"}, \
    {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_rightpart", color: "red"} \
]