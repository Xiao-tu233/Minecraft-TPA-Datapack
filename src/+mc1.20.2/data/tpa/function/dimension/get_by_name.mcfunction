# Parent function: tpa:dimension/get, tpa:dimension/get_by_name

execute store result score #dimension_not_found tpa.variables run data modify storage tpa:tpa temp.dimension[0].namespaceid set from storage tpa:tpa temp.args.id
execute if score #dimension_not_found tpa.variables matches 1 run data remove storage tpa:tpa temp.dimension[0]
execute if score #dimension_not_found tpa.variables matches 0 run data modify storage tpa:tpa temp.dimension set from storage tpa:tpa temp.dimension[0]

# Loop
execute if data storage tpa:tpa temp.dimension[0] if score #dimension_not_found tpa.variables matches 1 run function tpa:dimension/get_by_name