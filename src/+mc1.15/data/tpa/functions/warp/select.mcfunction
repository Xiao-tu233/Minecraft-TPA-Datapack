# Parent function: tpa:tick_

scoreboard players operation #editting_warp tpa.variables = #editting_warp.trigger tpa.variables

function tpa:warp/option
tellraw @a [{"storage":"tpa:tpa", "nbt":"loaded_lang.header"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_select_left_part"}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_number"}, {"score": {"objective":"tpa.variables","name":"#editting_warp"}}, {"storage":"tpa:tpa", "nbt":"loaded_lang.warp_select_right_part"}, ". "]