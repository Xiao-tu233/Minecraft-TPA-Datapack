# Parent function: tpa:search_id/enter_name, tpa:serach_id/merge_name_loop

data remove storage tpa:tpa temp.search_id.input[0]

$data modify storage tpa:tpa temp.args.input_name set value "$(input_name)$(char)"

data modify storage tpa:tpa temp.args.char set value ''
data modify storage tpa:tpa temp.args.char set from storage tpa:tpa temp.search_id.input[0]
scoreboard players set #is_not_str_end tpa.variables 0
execute store result score #is_not_str_end tpa.variables run data get storage tpa:tpa temp.args.char
execute if score #is_not_str_end tpa.variables matches 1 run function tpa:search_id/merge_name_loop with storage tpa:tpa temp.args