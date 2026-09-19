# Parent function: tpa:warp/edit/name/commit, tpa:warp/edit/desc/commit

function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.warp_edit_no_value"}, ". "]
