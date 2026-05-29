# Called by: (player) Any OP, quoted by: tpa:warp/show_each_macro
# @macro_param: {index: int}
# {x: int, y: int, z: int, dim: string[Dimension], name: str, desc: str, disabled: boolean}
$scoreboard players set #index tpa.variables $(index)
# return fail if index is 1 (the first warp cannot move up)
execute unless score #index tpa.variables matches 2.. run return 0
$data modify storage tpa:tpa temp.args.index set value $(index)
scoreboard players operation #previous_index tpa.variables = #index tpa.variables
scoreboard players remove #previous_index tpa.variables 1
execute store result storage tpa:tpa temp.args.previous_index int 1 run scoreboard players get #previous_index tpa.variables
function tpa:warp/moveup_macro with storage tpa:tpa temp.args
function tpa:warp/option