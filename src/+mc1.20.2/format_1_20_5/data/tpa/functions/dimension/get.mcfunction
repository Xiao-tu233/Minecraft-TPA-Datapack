# Parent function: 
# @input: tpa:tpa temp.args.id

data modify storage tpa:tpa temp.dimension set from storage tpa:tpa option.dimension
scoreboard players set #dimension_not_found tpa.variables 1
execute if score #uses_string_dimension tpa.config matches 1 run function tpa:dimension/get_by_name
execute if score #uses_string_dimension tpa.config matches 0 store result score #target_dimension tpa.variables run data get storage tpa:tpa temp.args.id
execute if score #uses_string_dimension tpa.config matches 0 run function tpa:dimension/get_by_id

execute if score #dimension_not_found tpa.variables matches 1 run function tpa:dimension/dimension_not_found