# Parent function: tpa:home/menu/prepare_output

scoreboard players add #home.output_slot tpa.variables 1
scoreboard players add #home.current_id tpa.variables 1
data modify storage tpa:tpa temp.output.slots append value {}
execute store result storage tpa:tpa temp.output.home_id int 1 run scoreboard players get #home.current_id tpa.variables
data modify storage tpa:tpa temp.output.home_id set string storage tpa:tpa temp.output.home_id

scoreboard players set #home.current_result_id tpa.variables -1
execute if data storage tpa:tpa temp.home_result[0].id store result score #home.current_result_id tpa.variables run data get storage tpa:tpa temp.home_result[0].id

execute if score #home.current_result_id tpa.variables = #home.current_id tpa.variables run function tpa:home/menu/prepare_output/existing
execute unless score #home.current_result_id tpa.variables = #home.current_id tpa.variables if score #home.current_id tpa.variables <= #home.max_id tpa.variables run function tpa:home/menu/prepare_output/missing

# Loop
execute if score #home.output_slot tpa.variables matches ..4 run function tpa:home/menu/prepare_output/loop
