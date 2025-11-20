# Parent function: tpa:search_id/input_key

# temp.args.input_name = sum(temp.search_id.input)
data modify storage tpa:tpa temp.args.input_name set value ''
data modify storage tpa:tpa temp.args.char set value ''
data modify storage tpa:tpa temp.args.char set from storage tpa:tpa temp.search_id.input[0]
scoreboard players set #is_not_str_end tpa.variables 0
execute store result score #is_not_str_end tpa.variables run data get storage tpa:tpa temp.args.char
execute if score #is_not_str_end tpa.variables matches 1 run function tpa:search_id/merge_name_loop with storage tpa:tpa temp.args

# Get player_id
execute store result score #player_id tpa.variables run function tpa:search_id/get_player_id with storage tpa:tpa temp.args

execute unless score #player_id tpa.variables matches 2.. run function tpa:sounds/no
execute unless score #player_id tpa.variables matches 2.. run tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.search_id_unavail_player"}, "." \
]
execute unless score #player_id tpa.variables matches 2.. run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.search_id_unavail_player"}]

execute if score #player_id tpa.variables matches 2.. run scoreboard players operation @s tpa.tpa = #player_id tpa.variables

# Clear temp
data remove storage tpa:tpa temp.search_id.input
function tpa:search_id/remove_input with storage tpa:tpa temp.args