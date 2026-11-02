# Parent Function: tpa:home/within_range
# This function is not techiquely a interface, this includes the output after home set is done

function tpa:home/capture
function tpa:home/upsert

# Keep the player's high-water Home slot current for the -9 add action.
function tpa:home/page/get
execute if score #home tpa.variables > #home.max_id tpa.variables run scoreboard players operation #home.max_id tpa.variables = #home tpa.variables
function tpa:home/page/set_max_id

# Outputs
data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output.langs set from storage tpa:tpa loaded_lang.home_set
data modify storage tpa:tpa temp.output.langs_format set from storage tpa:tpa loaded_lang.home_set_format
data modify storage tpa:tpa temp.output.args set value ["", []]
data modify storage tpa:tpa temp.output.args[0] set from storage tpa:tpa temp.home_candidate.id
data modify storage tpa:tpa temp.output.args[0] set string storage tpa:tpa temp.home_candidate.id

# Parse format of location langs
scoreboard players reset #output.index_format tpa.variables
execute store result score #output.index_format tpa.variables run data get storage tpa:tpa loaded_lang.home_set_position_format
data modify storage tpa:tpa temp.output.format_parser set value []

data modify storage tpa:tpa temp.output.coordinate_components set value ["", " ", "", " ", ""]
data modify storage tpa:tpa temp.output.coordinate_components[0] set string storage tpa:tpa temp.home_candidate.x
data modify storage tpa:tpa temp.output.coordinate_components[2] set string storage tpa:tpa temp.home_candidate.y
data modify storage tpa:tpa temp.output.coordinate_components[4] set string storage tpa:tpa temp.home_candidate.z

data modify storage tpa:tpa temp.args.id set from storage tpa:tpa temp.home_candidate.dimension
function tpa:dimension/get

data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.home_set_position[0]
execute if score #output.index_format tpa.variables matches 0 run function tpa:home/set/append_coordinate_components
execute if score #output.index_format tpa.variables matches 1 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.dimension.name
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.home_set_position[1]
execute if score #output.index_format tpa.variables matches 0 run data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa temp.dimension.name
execute if score #output.index_format tpa.variables matches 1 run function tpa:home/set/append_coordinate_components
data modify storage tpa:tpa temp.output.format_parser append from storage tpa:tpa loaded_lang.home_set_position[2]

# args[1] contains x,y,z,dim,home_set_position
data modify storage tpa:tpa temp.output.args[1] set from storage tpa:tpa temp.output.format_parser
data modify storage tpa:tpa temp.output.arg_hovers set value ["", ""]
function tpa:output/two_args
