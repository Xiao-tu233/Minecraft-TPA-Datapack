# Parent function: tpa:dimension/get, tpa:dimension/get_by_id

execute store result score #dimension_id tpa.variables run data get storage tpa:tpa temp.dimension[0].id
execute if score #dimension_id tpa.variables = #target_dimension tpa.variables run scoreboard players set #dimension_not_found tpa.variables 0
execute if score #dimension_id tpa.variables = #target_dimension tpa.variables run data modify storage tpa:tpa temp.dimension set from storage tpa:tpa temp.dimension[0]
execute unless score #dimension_id tpa.variables = #target_dimension tpa.variables run data remove storage tpa:tpa temp.dimension[0]
# Loop
execute if data storage tpa:tpa temp.dimension[0] if score #dimension_not_found tpa.variables matches 1 run function tpa:dimension/get_by_id