
# call string map to see if the main command is tpa
data modify storage tpa:tpa temp.args.src set from storage tpa:tpa temp.key_commands[-1].commands[0]
data modify storage tpa:tpa temp.string_map set value {tpa:1b}
execute store result score #is_tpa_command tpa.variables run function tpa:string_map with storage tpa:tpa temp.args

execute if score #is_tpa_command tpa.variables matches 1 \
    run data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.key_commands[-1].name
execute if score #is_tpa_command tpa.variables matches 1 run function tpa:tag_executor with storage tpa:tpa temp.args

execute store result score #command_len tpa.variables run data get storage tpa:tpa temp.key_commands[-1].commands
# search_id: tpa <target: TargetSelector>
# tp_pos: tpa <x: int> <y: int> <z: int>
# So we can separate according to the argument count
# But the more strict way is to do the data type inference for every arg
execute as @p[tag=to_modify] run function tpa:load_lang

scoreboard players set #wrong_syntax tpa.variables 0
execute if score #is_tpa_command tpa.variables matches 1 if score #command_len tpa.variables matches 1..2 as @p[tag=to_modify] \
    run function tpa:search_id/detected
execute if score #is_tpa_command tpa.variables matches 1 if score #command_len tpa.variables matches 4 as @p[tag=to_modify] \
    run function tpa:tp_pos/detected
execute if score #is_tpa_command tpa.variables matches 1 if score #command_len tpa.variables matches 3 run scoreboard players set #wrong_syntax tpa.variables 1
execute if score #is_tpa_command tpa.variables matches 1 if score #command_len tpa.variables matches 5.. run scoreboard players set #wrong_syntax tpa.variables 1


# Throw error in case of wrong count of args providing
execute if score #wrong_syntax tpa.variables matches 1 as @p[tag=to_modify] run function tpa:sounds/no
execute if score #wrong_syntax tpa.variables matches 1 run tellraw @p[tag=to_modify, scores={tpa.output=1..2}] [\
    {storage:"tpa:tpa", nbt:"temp.lang.header"}, \
    {storage:"tpa:tpa", nbt:"temp.lang.command_syntax_error"}, "." \
]
execute if score #wrong_syntax tpa.variables matches 1 run title @p[tag=to_modify, scores={tpa.output=0..1}] actionbar [{storage:"tpa:tpa", nbt:"temp.lang.command_syntax_error", color: "red"}]

execute if score #is_tpa_command tpa.variables matches 0 \
    run data modify storage tpa:tpa temp.not_matching_commands append from storage tpa:tpa temp.key_commands[-1]

data remove storage tpa:tpa temp.key_commands[-1]
tag @a remove to_modify

# i++;
scoreboard players add #i tpa.variables 1

# if #i >= #commands_reqs_handling {break;}
execute if score #i tpa.variables > #commands_count key.var run return 0

# Recursive call
function tpa:key_handler_loop