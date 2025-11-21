# Parent functin: tpa:warp
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage:"tpa:tpa", nbt:"loaded_lang.header"},\
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_leftpart"}, \
    {storage:"tpa:tpa", nbt:"temp.warp.name"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_rightpart"}, \
    ". "\
    ]
title @s[predicate=tpa:output/show_actionbar] actionbar [\
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_leftpart", color: "red"}, \
    {storage:"tpa:tpa", nbt:"temp.warp.name", color: "red"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.warp_slot_disabled_rightpart", color: "red"} \
]