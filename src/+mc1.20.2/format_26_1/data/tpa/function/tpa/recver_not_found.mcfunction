function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.header"}, {interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_not_exist"}, ". "]
title @s[predicate=tpa:output/show_actionbar] actionbar [{interpret: true, storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_not_exist", color: "red"}]