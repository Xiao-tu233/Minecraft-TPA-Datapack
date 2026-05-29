# Called by: (player) Any OP, quoted by: tpa:warp/show_each_macro
# @macro_param: {index: int}
# {x: int, y: int, z: int, dim: string[Dimension], name: str, desc: str, disabled: boolean}
$scoreboard players set #index tpa.variables $(index)
$data modify storage tpa:tpa temp.args.index set value $(index)
scoreboard players operation #next_index tpa.variables = #index tpa.variables
scoreboard players add #next_index tpa.variables 1
execute store result storage tpa:tpa temp.args.next_index int 1 run scoreboard players get #next_index tpa.variables
function tpa:warp/movedown_macro with storage tpa:tpa temp.args
function tpa:warp/option