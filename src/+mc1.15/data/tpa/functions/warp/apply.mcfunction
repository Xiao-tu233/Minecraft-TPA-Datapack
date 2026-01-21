# Called by: (Player) Any Op, Quoted by tpa:warp/menu
# @macro: {index: int}
scoreboard players operation #warp tpa.variables = #editting_warp tpa.variables
data modify storage tpa:tpa temp.warp set from storage tpa:tpa temp.editted_warp 
scoreboard players set #op tpa.variables 1
function tpa:warp/iterator/main
scoreboard players set #editting_warp tpa.variables 0
scoreboard players set #editting_warp.trigger tpa.variables 0
function tpa:warp/option
tellraw @s [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_left_part"}, {"storage":"tpa:tpa", "nbt":"temp.editted_warp.name"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_middle_part"}, {"storage":"tpa:tpa", "nbt":"temp.editted_warp.dimension"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_position"}, {"storage":"tpa:tpa", "nbt":"temp.editted_warp.x"}, " ", {"storage":"tpa:tpa", "nbt":"temp.editted_warp.y"}, " ", {"storage":"tpa:tpa", "nbt":"temp.editted_warp.z"}, " ", {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_set_right_part"}, "." ]