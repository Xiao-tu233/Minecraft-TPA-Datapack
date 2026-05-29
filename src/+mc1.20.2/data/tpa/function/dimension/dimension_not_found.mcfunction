scoreboard players operation #target_lang tpa.variables = #language tpa.config
function tpa:load_lang
data modify storage tpa:tpa temp.dimension set value {namespaceid: "", id: "", color: "dark_red"}
# dimension_id = 999 - len(dimension)
execute store result score #dimension_id tpa.variables run data get storage tpa:tpa temp.dimension
scoreboard players operation #dimension_id tpa.variables *= #-1 tpa.variables
scoreboard players add #dimension_id tpa.variables 999
execute if score #uses_string_dimension tpa.config matches 1 run data modify storage tpa:tpa temp.dimension.name set from storage tpa:tpa temp.args.id
execute if score #uses_string_dimension tpa.config matches 1 store result storage tpa:tpa temp.dimension.id int 1 run scoreboard players get #dimension_id tpa.variables
execute if score #uses_string_dimension tpa.config matches 0 run data modify storage tpa:tpa temp.dimension.id set from storage tpa:tpa temp.args.id
data modify storage tpa:tpa temp.dimension.name set from storage tpa:tpa loaded_lang.dimension_unknown

# Add dimension if unknown one is met
data modify storage tpa:tpa option.dimension append from storage tpa:tpa temp.dimension