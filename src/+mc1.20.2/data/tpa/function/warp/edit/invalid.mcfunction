# Parent function: tpa:warp/edit/name/apply, tpa:warp/edit/desc/apply

data remove storage tpa:tpa temp.warp
data remove storage tpa:tpa temp.warp_candidate
function tpa:sounds/no
tellraw @s[predicate=tpa:output/show_chatbar] [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.header"}, {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.warp_edit_invalid"}, ". "]
