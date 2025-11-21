# Parent function: tpa:warp/menu
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{storage:"tpa:tpa", nbt:"loaded_lang.header"}, {storage:"tpa:tpa", nbt:"loaded_lang.warp_disabled"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.warp_disabled", color:"red"}]