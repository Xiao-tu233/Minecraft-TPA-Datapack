scoreboard players operation #key tpa.variables = @s tpa.search_id.key
scoreboard players operation #capslock tpa.variables = @s tpa.search_id.capslock
scoreboard players set @s tpa.search_id.key 0

function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:search_id/get_input with storage tpa:tpa temp.args
execute if score #key tpa.variables matches 1 run data modify storage tpa:tpa temp.search_id.input append value '1'
execute if score #key tpa.variables matches 2 run data modify storage tpa:tpa temp.search_id.input append value '2'
execute if score #key tpa.variables matches 3 run data modify storage tpa:tpa temp.search_id.input append value '3'
execute if score #key tpa.variables matches 4 run data modify storage tpa:tpa temp.search_id.input append value '4'
execute if score #key tpa.variables matches 5 run data modify storage tpa:tpa temp.search_id.input append value '5'
execute if score #key tpa.variables matches 6 run data modify storage tpa:tpa temp.search_id.input append value '6'
execute if score #key tpa.variables matches 7 run data modify storage tpa:tpa temp.search_id.input append value '7'
execute if score #key tpa.variables matches 8 run data modify storage tpa:tpa temp.search_id.input append value '8'
execute if score #key tpa.variables matches 9 run data modify storage tpa:tpa temp.search_id.input append value '9'
execute if score #key tpa.variables matches 10 run data modify storage tpa:tpa temp.search_id.input append value '0'
execute if score #key tpa.variables matches 11 run data modify storage tpa:tpa temp.search_id.input append value '_'
execute if score #key tpa.variables matches 12 run data remove storage tpa:tpa temp.search_id.input[-1]
execute if score #capslock tpa.variables matches 0 run function tpa:search_id/input_key/lowercase
execute if score #capslock tpa.variables matches 1 run function tpa:search_id/input_key/uppercase
execute if score #key tpa.variables matches 41 run data modify storage tpa:tpa temp.search_id.input append value ' '
execute if score #key tpa.variables matches 33 run function tpa:search_id/enter_name

execute unless score #key tpa.variables matches 33 run function tpa:search_id/set_input with storage tpa:tpa temp.args
execute unless score #key tpa.variables matches 33 run function tpa:search_id/call_keyboard