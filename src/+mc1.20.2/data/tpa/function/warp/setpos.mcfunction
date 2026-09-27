# Parent function: tpa:warp/setpos/slot_*

function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.setpos.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get

data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result
execute store result storage tpa:tpa warp_candidate.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa warp_candidate.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa warp_candidate.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa warp_candidate.dim set from entity @s Dimension

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/set

function tpa:warp/option

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_set
data modify storage tpa:tpa temp.output.langs_format set from storage tpa:tpa loaded_lang.warp_set_format
data modify storage tpa:tpa temp.output.args set value ["", []]
data modify storage tpa:tpa temp.output.args[0] set from storage tpa:tpa temp.warp_candidate.name
# args[1] contains x,y,z,dim,warp_set_position
# data modify storage tpa:tpa temp.output.args[1] append from storage tpa:tpa temp.warp_candidate.x
data modify storage tpa:tpa temp.output.arg_hovers set value []
data modify storage tpa:tpa temp.output.arg_hovers append from storage tpa:tpa temp.warp_candidate.desc
data modify storage tpa:tpa temp.output.arg_hovers append value ""
function tpa:output/two_args