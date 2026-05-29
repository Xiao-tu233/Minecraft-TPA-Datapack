
function tpa:load_lang

execute if score #command_len tpa.variables matches 1 run function tpa:sounds/no
execute if score #command_len tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_not_exist"}, "." \
]
execute if score #command_len tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.reqer_req_not_exist"}]
execute if score #command_len tpa.variables matches 1 run return 0

data modify storage tpa:tpa temp.args.self set from storage tpa:tpa temp.key_commands[-1].commands[1]
execute store result score #name_len tpa.variables run data get storage tpa:tpa temp.args.self
scoreboard players set #j tpa.variables 0
data modify storage tpa:tpa temp.string_map set value {\
    a: 1b, b: 1b, c: 1b, d: 1b, e: 1b, f: 1b, g: 1b, h: 1b, i: 1b, j: 1b, k: 1b, l: 1b, m: 1b, \
    n: 1b, o: 1b, p: 1b, q: 1b, r: 1b, s: 1b, t: 1b, u: 1b, v: 1b, w: 1b, x: 1b, y: 1b, z: 1b, \
    A: 1b, B: 1b, C: 1b, D: 1b, E: 1b, F: 1b, G: 1b, H: 1b, I: 1b, J: 1b, K: 1b, L: 1b, M: 1b, \
    N: 1b, O: 1b, P: 1b, Q: 1b, R: 1b, S: 1b, T: 1b, U: 1b, V: 1b, W: 1b, X: 1b, Y: 1b, Z: 1b, \
    1: 1b, 2: 1b, 3: 1b, 4: 1b, 5: 1b, 6: 1b, 7: 1b, 8: 1b, 9: 1b, 0: 1b, _: 1b \
}
execute store result score #has_illegal_char tpa.variables run function tpa:search_id/char_loop

execute if score #has_illegal_char tpa.variables matches 1 run function tpa:sounds/no
execute if score #has_illegal_char tpa.variables matches 1 run tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.search_id_throw_on_invalid_char"}, "." \
]
execute if score #has_illegal_char tpa.variables matches 1 run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.search_id_throw_on_invalid_char"}]
execute if score #has_illegal_char tpa.variables matches 1 run return 0

data modify storage tpa:tpa temp.args.player set from storage tpa:tpa temp.key_commands[-1].commands[1]
execute store result score #tp_to tpa.variables run function tpa:search_id/get_player_id with storage tpa:tpa temp.args

execute unless score #tp_to tpa.variables matches 2.. run function tpa:sounds/no
execute unless score #tp_to tpa.variables matches 2.. run tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage:"tpa:tpa", nbt:"loaded_lang.header"}, \
    {storage:"tpa:tpa", nbt:"loaded_lang.search_id_unavail_player"}, "." \
]
execute unless score #tp_to tpa.variables matches 2.. run title @s[predicate=tpa:output/show_actionbar] actionbar [{storage:"tpa:tpa", nbt:"loaded_lang.search_id_unavail_player"}]
execute unless score #tp_to tpa.variables matches 2.. run return 0

scoreboard players operation @s tpa.tpa = #tp_to tpa.variables
