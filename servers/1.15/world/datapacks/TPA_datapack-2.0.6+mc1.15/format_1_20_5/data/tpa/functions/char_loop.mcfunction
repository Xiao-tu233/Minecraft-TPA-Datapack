# @param: {self: str}
# Use j as iterator variable cuz i is ocupied by the grandpa function tpa:key_handler_loop

data modify storage tpa:tpa temp.args.src set string storage tpa:tpa temp.args.self 0 1
scoreboard players set #is_char_valid tpa.variables 0
execute store result score #is_char_valid tpa.variables run function tpa:string_map with storage tpa:tpa temp.args
execute if score #is_char_valid tpa.variables matches 0 run return 1

# self = self[1:]
data modify storage tpa:tpa temp.args.self set string storage tpa:tpa temp.args.self 1

# j++
scoreboard players add #j tpa.variables 1

# if j >= len(self) {break;}
execute if score #j tpa.variables >= #name_len tpa.variables run return 0

# Recursive call
function tpa:char_loop with storage tpa:tpa temp.args