# Parent function: tpa:search_id, tpa:search_id/input_key
function tpa:load_lang

# Storage format
# {
#     name1: his_input: list[char],
#     name2: his_input: list[char],
#     ...
# }
data remove storage tpa:tpa temp.args
function tpa:get_name
data modify storage tpa:tpa temp.args.name set from storage tpa:tpa temp.name
function tpa:search_id/get_input with storage tpa:tpa temp.args

execute unless score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.capslock set value '§b[Caps]'
execute if score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.capslock set value '§b[§aCAPS§b]'
execute unless score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.caps set value '§bCaps'
execute if score @s tpa.search_id.capslock matches 1 run data modify storage tpa:tpa temp.args.caps set value '§aCAPS'

summon minecraft:text_display ~ ~ ~ {alignment:"center",Tags:["tpa.text_display"]}
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value [{storage: "tpa:tpa", nbt: "temp.search_id.input[]", separator: ""}, {text: " ", underlined: true}]
data modify storage tpa:tpa temp.args.input set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set value ""
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.search_id_dialog_done_tooltip
data modify storage tpa:tpa temp.args.done_tooltip set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text
data modify entity @n[type=minecraft:text_display,tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.search_id_dialog_cancel_tooltip
data modify storage tpa:tpa temp.args.cancel_tooltip set from entity @n[type=minecraft:text_display,tag=tpa.text_display] text
kill @n[type=minecraft:text_display,tag=tpa.text_display]
function tpa:search_id/dialog with storage tpa:tpa temp.args
# Keyboard style
# [ESC] [1] [2] [3] [4] [5] [6] [7] [8] [9] [0] [-] [backspace]
#       [q] [w] [e] [r] [t] [y] [u] [i] [o] [p]
# [caps] [a] [s] [d] [f] [g] [h] [j] [k] [l] [enter]
#         [z] [x] [c] [v] [b] [n] [m]
#         [     ---space---     ] 

tellraw @s[predicate=tpa:output/show_chatbar] [\
    {storage: "tpa:tpa", nbt: "loaded_lang.header"}, \
    {storage: "tpa:tpa", nbt: "loaded_lang.search_id_name_input"}, \
    {storage: "tpa:tpa", nbt: "temp.search_id.input[]", separator: ""}, {text: " ", underlined: true}, \
    "\n", \
    {storage: "tpa:tpa", nbt: "loaded_lang.search_id_keyboard_title"}, \
    "\n", \
    {text:"[ESC]", color: "aqua", hover_event: {action: "show_text", value: {text: "Abort key inputs"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set -1"}}, " ", \
    {text:"[1]", color: "aqua", hover_event: {action: "show_text", value: {text: "1"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 1"}}, " ", \
    {text:"[2]", color: "aqua", hover_event: {action: "show_text", value: {text: "2"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 2"}}, " ", \
    {text:"[3]", color: "aqua", hover_event: {action: "show_text", value: {text: "3"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 3"}}, " ", \
    {text:"[4]", color: "aqua", hover_event: {action: "show_text", value: {text: "4"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 4"}}, " ", \
    {text:"[5]", color: "aqua", hover_event: {action: "show_text", value: {text: "5"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 5"}}, " ", \
    {text:"[6]", color: "aqua", hover_event: {action: "show_text", value: {text: "6"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 6"}}, " ", \
    {text:"[7]", color: "aqua", hover_event: {action: "show_text", value: {text: "7"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 7"}}, " ", \
    {text:"[8]", color: "aqua", hover_event: {action: "show_text", value: {text: "8"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 8"}}, " ", \
    {text:"[9]", color: "aqua", hover_event: {action: "show_text", value: {text: "9"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 9"}}, " ", \
    {text:"[0]", color: "aqua", hover_event: {action: "show_text", value: {text: "0"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 10"}}, " ", \
    {text:"[_]", color: "aqua", hover_event: {action: "show_text", value: {text: "_"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 11"}}, " ", \
    {text:"[Backspace]", color: "aqua", hover_event: {action: "show_text", value: {text: "backspace"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 12"}}, " ", \
    "\n        ", \
    {text:"[q]", color: "aqua", hover_event: {action: "show_text", value: {text: "q"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 13"}}, " ", \
    {text:"[w]", color: "aqua", hover_event: {action: "show_text", value: {text: "w"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 14"}}, " ", \
    {text:"[e]", color: "aqua", hover_event: {action: "show_text", value: {text: "e"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 15"}}, " ", \
    {text:"[r]", color: "aqua", hover_event: {action: "show_text", value: {text: "r"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 16"}}, " ", \
    {text:"[t]", color: "aqua", hover_event: {action: "show_text", value: {text: "t"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 17"}}, " ", \
    {text:"[y]", color: "aqua", hover_event: {action: "show_text", value: {text: "y"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 18"}}, " ", \
    {text:"[u]", color: "aqua", hover_event: {action: "show_text", value: {text: "u"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 19"}}, " ", \
    {text:"[i]", color: "aqua", hover_event: {action: "show_text", value: {text: "i"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 20"}}, " ", \
    {text:"[o]", color: "aqua", hover_event: {action: "show_text", value: {text: "o"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 21"}}, " ", \
    {text:"[p]", color: "aqua", hover_event: {action: "show_text", value: {text: "p"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 22"}}, " ", \
    "\n", \
    {storage: "tpa:tpa", nbt: "temp.args.capslock", hover_event: {action: "show_text", value: {text: "caps"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 23"}}, " ", \
    {text:"[a]", color: "aqua", hover_event: {action: "show_text", value: {text: "a"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 24"}}, " ", \
    {text:"[s]", color: "aqua", hover_event: {action: "show_text", value: {text: "s"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 25"}}, " ", \
    {text:"[d]", color: "aqua", hover_event: {action: "show_text", value: {text: "d"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 26"}}, " ", \
    {text:"[f]", color: "aqua", hover_event: {action: "show_text", value: {text: "f"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 27"}}, " ", \
    {text:"[g]", color: "aqua", hover_event: {action: "show_text", value: {text: "g"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 28"}}, " ", \
    {text:"[h]", color: "aqua", hover_event: {action: "show_text", value: {text: "h"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 29"}}, " ", \
    {text:"[j]", color: "aqua", hover_event: {action: "show_text", value: {text: "j"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 30"}}, " ", \
    {text:"[k]", color: "aqua", hover_event: {action: "show_text", value: {text: "k"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 31"}}, " ", \
    {text:"[l]", color: "aqua", hover_event: {action: "show_text", value: {text: "l"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 32"}}, " ", \        
    {text:"[Enter]", color: "aqua", hover_event: {action: "show_text", value: {text: "enter"}},  click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 33"}}, " ", \
    "\n          ", \
    {text:"[z]", color: "aqua", hover_event: {action: "show_text", value: {text: "z"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 34"}}, " ", \
    {text:"[x]", color: "aqua", hover_event: {action: "show_text", value: {text: "x"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 35"}}, " ", \
    {text:"[c]", color: "aqua", hover_event: {action: "show_text", value: {text: "c"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 36"}}, " ", \
    {text:"[v]", color: "aqua", hover_event: {action: "show_text", value: {text: "v"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 37"}}, " ", \
    {text:"[b]", color: "aqua", hover_event: {action: "show_text", value: {text: "b"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 38"}}, " ", \
    {text:"[n]", color: "aqua", hover_event: {action: "show_text", value: {text: "n"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 39"}}, " ", \
    {text:"[m]", color: "aqua", hover_event: {action: "show_text", value: {text: "m"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 40"}}, \
    "\n          ", \
    {text:"[     ---space---     ]", color: "aqua", hover_event: {action: "show_text", value: {text: "space"}}, click_event:{action:"run_command",command: "/trigger tpa.search_id.key set 41"}}, " " \    
]

