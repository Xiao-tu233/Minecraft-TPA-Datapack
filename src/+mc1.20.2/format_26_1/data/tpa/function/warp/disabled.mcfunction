# Parent function: tpa:warp/menu
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_disabled"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.warp_disabled", color:"red"}]