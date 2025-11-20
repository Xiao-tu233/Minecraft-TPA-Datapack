# Parent function: tpa:search_id, tpa:search_id/input_key
function tpa:load_lang

# Storage format
# {
#     name1: his_input: list[char],
#     name2: his_input: list[char],
#     ...
# }
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:search_id/get_input with storage tpa:tpa temp.args

execute unless score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.capslock set value '§b[Caps]'
execute if score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.capslock set value '§b[§aCAPS§b]'
# Keyboard style
# [ESC] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [backspace]
#       [q] [w] [e] [r] [t] [y] [u] [i] [o] [p]
# [caps] [a] [s] [d] [f] [g] [h] [j] [k] [l] [enter]
#         [z] [x] [c] [v] [b] [n] [m]
#         [     ---space---     ] 

tellraw @s[predicate=tpa:output/show_chatbar] [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_name_input"}, \
    {"storage": "tpa:tpa", "nbt": "temp.search_id.input[]", "separator": ""}, {"text": " ", "underlined": true}, \
    "\n", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.search_id_keyboard_title"}, \
    "\n", \
    {"text":"[ESC]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "Abort key inputs"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set -1"}}, " ", \
    {"text":"[1]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "1"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 1"}}, " ", \
    {"text":"[2]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "2"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 2"}}, " ", \
    {"text":"[3]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "3"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 3"}}, " ", \
    {"text":"[4]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "4"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 4"}}, " ", \
    {"text":"[5]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "5"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 5"}}, " ", \
    {"text":"[6]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "6"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 6"}}, " ", \
    {"text":"[7]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "7"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 7"}}, " ", \
    {"text":"[8]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "8"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 8"}}, " ", \
    {"text":"[9]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "9"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 9"}}, " ", \
    {"text":"[0]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "0"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 10"}}, " ", \
    {"text":"[_]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "_"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 11"}}, " ", \
    {"text":"[Backspace]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "backspace"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 12"}}, " ", \
    "\n        ", \
    {"text":"[q]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "q"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 13"}}, " ", \
    {"text":"[w]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "w"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 14"}}, " ", \
    {"text":"[e]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "e"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 15"}}, " ", \
    {"text":"[r]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "r"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 16"}}, " ", \
    {"text":"[t]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "t"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 17"}}, " ", \
    {"text":"[y]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "y"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 18"}}, " ", \
    {"text":"[u]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "u"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 19"}}, " ", \
    {"text":"[i]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "i"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 20"}}, " ", \
    {"text":"[o]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "o"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 21"}}, " ", \
    {"text":"[p]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "p"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 22"}}, " ", \
    "\n", \
    {"storage": "tpa:tpa", "nbt": "temp.args.capslock", "hoverEvent": {"action": "show_text", "value": {"text": "caps"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 23"}}, " ", \
    {"text":"[a]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "a"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 24"}}, " ", \
    {"text":"[s]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "s"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 25"}}, " ", \
    {"text":"[d]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "d"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 26"}}, " ", \
    {"text":"[f]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "f"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 27"}}, " ", \
    {"text":"[g]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "g"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 28"}}, " ", \
    {"text":"[h]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "h"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 29"}}, " ", \
    {"text":"[j]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "j"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 30"}}, " ", \
    {"text":"[k]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "k"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 31"}}, " ", \
    {"text":"[l]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "l"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 32"}}, " ", \        
    {"text":"[Enter]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "enter"}},  "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 33"}}, " ", \
    "\n          ", \
    {"text":"[z]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "z"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 34"}}, " ", \
    {"text":"[x]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "x"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 35"}}, " ", \
    {"text":"[c]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "c"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 36"}}, " ", \
    {"text":"[v]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "v"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 37"}}, " ", \
    {"text":"[b]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "b"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 38"}}, " ", \
    {"text":"[n]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "n"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 39"}}, " ", \
    {"text":"[m]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "m"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 40"}}, \
    "\n          ", \
    {"text":"[     ---space---     ]", "color": "aqua", "hoverEvent": {"action": "show_text", "value": {"text": "space"}}, "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id.key set 41"}}, " " \    
]

