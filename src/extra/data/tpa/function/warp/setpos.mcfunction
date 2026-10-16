# Parent function: tpa:warp/setpos/slot_*

function tpa:warp/edit/slot_offset
scoreboard players operation #warp.edit.index tpa.variables = #warp.setpos.slot tpa.variables
scoreboard players operation #warp.edit.index tpa.variables += #warp.page.offset tpa.variables

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/get

data modify storage tpa:tpa temp.warp_candidate set from storage tpa:tpa temp.warp_result
execute store result storage tpa:tpa temp.warp_candidate.x int 1 run data get entity @s Pos[0]
execute store result storage tpa:tpa temp.warp_candidate.y int 1 run data get entity @s Pos[1]
execute store result storage tpa:tpa temp.warp_candidate.z int 1 run data get entity @s Pos[2]
data modify storage tpa:tpa temp.warp_candidate.dim set from entity @s Dimension

scoreboard players operation #warp tpa.variables = #warp.edit.index tpa.variables
function tpa:warp/set

function tpa:warp/option

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.warp_set
data modify storage tpa:tpa temp.output.langs_format set from storage tpa:tpa loaded_lang.warp_set_format
data modify storage tpa:tpa temp.output.args set value ["", []]
data modify storage tpa:tpa temp.output.args[0] set from storage tpa:tpa temp.warp_candidate.name

# Parse format of location langs
scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa loaded_lang.warp_hoverevent_location_format
data modify storage tpa:tpa temp.output.format_parser set value []

data modify storage tpa:tpa temp.output.append_indexes.enabled.tooltip.x set string storage tpa:tpa temp.warp_candidate.x
data modify storage tpa:tpa temp.output.append_indexes.enabled.tooltip.y set string storage tpa:tpa temp.warp_candidate.y
data modify storage tpa:tpa temp.output.append_indexes.enabled.tooltip.z set string storage tpa:tpa temp.warp_candidate.z
data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.warp_candidate.dim
function tpa:dimension/get
data modify storage tpa:tpa temp.output.append_indexes.enabled.tooltip.dimension set from storage tpa:tpa temp.dimension.name

data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.warp_hoverevent_location[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:output/warp/append_indexes
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.append_indexes.enabled.tooltip.dimension
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.warp_hoverevent_location[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.output.append_indexes.enabled.tooltip.dimension
execute if score #output.index_format tpa.variables matches 1 run function tpa:output/warp/append_indexes
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.warp_hoverevent_location[2]


# args[1] contains x,y,z,dim,warp_set_position
data modify storage tpa:tpa temp.output.args[1] set from storage tpa:tpa temp.output.format_parser
data modify storage tpa:tpa temp.output.arg_hovers set value []
data modify storage tpa:tpa temp.output.arg_hovers append from storage tpa:tpa temp.warp_candidate.desc
data modify storage tpa:tpa temp.output.arg_hovers append value ""
function tpa:output/two_args