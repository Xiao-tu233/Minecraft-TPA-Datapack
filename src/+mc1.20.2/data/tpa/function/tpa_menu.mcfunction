scoreboard players set @s tpa.tpa -1
scoreboard players set @s tpa -1

function tpa:load_lang

function tpa:sounds/levelup

scoreboard players set #request_menu.direction tpa.variables 0
scoreboard players set #request_menu.page tpa.variables 1
function tpa:request_menu/open

tellraw @s [\
    " ", \
    {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_you", \
        color: "gold", \
        hover_event: {\
            action: "show_text", \
            value: {selector: "@s"}\
        }\
    }, \
    {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_has_id_of", \
        hover_event: {\
            action: "show_text", \
            "value": {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_has_id_of_hoverevent"} \
        }\
    }, \
    {\
        color: "aqua", \
        score: {name: "@s", objective: "tpa.uid"} \
    }\
]

data remove storage tpa:tpa temp.menu

# Search ID
data modify storage tpa:tpa temp.menu.search_id.label set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button
execute if score #search_id tpa.config matches 0 run function tpa:menu/search_id
execute if score #search_id tpa.config matches 1 run function tpa:menu/search_id_disabled

# Tpahere Menu
data modify storage tpa:tpa temp.menu.tpaheremenu.left_bracket set value "["
data modify storage tpa:tpa temp.menu.tpaheremenu.label set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button
data modify storage tpa:tpa temp.menu.tpaheremenu.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button_hoverevent
data modify storage tpa:tpa temp.menu.tpaheremenu.right_bracket set value "]"

# Back
data modify storage tpa:tpa temp.menu.back.label set from storage tpa:tpa loaded_lang.tpa_menu_back_button
execute if score #back tpa.config matches 1 run function tpa:menu/back/disabled
execute if score #back tpa.config matches 0 run function tpa:menu/back/enabled

# Language Menu
data modify storage tpa:tpa temp.menu.lang.left_bracket set value "["
data modify storage tpa:tpa temp.menu.lang.label set from storage tpa:tpa loaded_lang.tpa_menu_lang_button
data modify storage tpa:tpa temp.menu.lang.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_lang_button_hoverevent
data modify storage tpa:tpa temp.menu.lang.right_bracket set value "]"

# Formatted output
tellraw @s ["", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.left_bracket", click_event: {action: "run_command", command: "/trigger tpa.search_id"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.right_bracket"}]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.left_bracket", click_event: {action: "run_command", command: "/trigger tpa.tpahere"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.right_bracket"}]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.left_bracket", click_event: {action: "run_command", command: "/trigger tpa.back"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.label", color: "aqua"}, "]"]}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.right_bracket"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.left_bracket", click_event: {action: "run_command", command: "/trigger tpa.language set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_lang_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.right_bracket"}]}, " " \
]

# Book
data modify storage tpa:tpa temp.menu.book.label set from storage tpa:tpa loaded_lang.tpa_menu_book_button
execute if score #book tpa.config matches 0 run function tpa:menu/book/disabled
execute if score #book tpa.config matches 1 run function tpa:menu/book/enabled

# Pos
data modify storage tpa:tpa temp.menu.pos.left_bracket set value "["
data modify storage tpa:tpa temp.menu.pos.label set from storage tpa:tpa loaded_lang.tpa_menu_pos_button
data modify storage tpa:tpa temp.menu.pos.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_pos_button_hoverevent
data modify storage tpa:tpa temp.menu.pos.right_bracket set value "]"

# Here
data modify storage tpa:tpa temp.menu.here.left_bracket set value "["
data modify storage tpa:tpa temp.menu.here.label set from storage tpa:tpa loaded_lang.tpa_menu_here_button
data modify storage tpa:tpa temp.menu.here.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_here_button_hoverevent
data modify storage tpa:tpa temp.menu.here.right_bracket set value "]"

# Home
data modify storage tpa:tpa temp.menu.back.label set from storage tpa:tpa loaded_lang.tpa_menu_home_button
execute if score #home tpa.config matches 0 run function tpa:menu/home/disabled
execute if score #home tpa.config matches 1.. run function tpa:menu/home/enabled

# Warp
data modify storage tpa:tpa temp.menu.warp.label set from storage tpa:tpa loaded_lang.tpa_menu_warp_button
execute if score #warp tpa.config matches 0 run function tpa:menu/warp/disabled
execute if score #warp tpa.config matches 1.. run function tpa:menu/warp/enabled


tellraw @s ["", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.book"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.pos"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.here"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.home set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.warp set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button", color: "aqua"}, "]"]}, " " \
]

tellraw @s [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_auto_accept"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", color: "green"}]}, "|", \
    {text: "", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 2"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", color: "red"}, "]"]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_mute"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.mute set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", color: "green"}]}, "|", \
    {text: "", click_event:{action:"run_command",command: "/trigger tpa.mute set 2"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", color: "red"}, "]"]}, " \n ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.output set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_default", color: "aqua"}]}, "|", \
    {text: "", click_event:{action:"run_command",command: "/trigger tpa.output set 4"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_actionbar", color: "aqua"}]}, "|", \
    {text: "", click_event:{action:"run_command",command: "/trigger tpa.output set 5"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_chatbar", color: "aqua"}, "]"]}, " " \
]
tellraw @s [\
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.tpa"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh", color: "gold"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.dialog"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_dialog_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_dialog", color: "aqua"}, "]"]}, " " \
]
