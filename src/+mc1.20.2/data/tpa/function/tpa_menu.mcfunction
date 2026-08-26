scoreboard players set @s tpa.tpa -1
scoreboard players set @s tpa -1

function tpa:load_lang

function tpa:sounds/levelup

scoreboard players set #request_menu.direction tpa.variables 0
scoreboard players set #request_menu.page tpa.variables 1
scoreboard players set #request_menu.render tpa.variables 1
function tpa:request_menu/prepare
function tpa:request_menu/display

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
data modify storage tpa:tpa temp.menu.search_id.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.search_id.label set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button
data modify storage tpa:tpa temp.menu.search_id.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_search_id_button_hoverevent
execute if score #search_id tpa.config matches 1 run function tpa:menu/search_id/disabled

# Tpahere Menu
data modify storage tpa:tpa temp.menu.tpaheremenu.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.tpaheremenu.label set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button
data modify storage tpa:tpa temp.menu.tpaheremenu.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_tpaheremenu_button_hoverevent

# Back
data modify storage tpa:tpa temp.menu.back.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.back.label set from storage tpa:tpa loaded_lang.tpa_menu_back_button
data modify storage tpa:tpa temp.menu.back.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_back_button_hoverevent
execute if score #back tpa.config matches 1 run function tpa:menu/back/disabled
execute if score #back tpa.config matches 0 unless predicate tpa:available run function tpa:menu/back/unavailable

# Language Menu
data modify storage tpa:tpa temp.menu.lang.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.lang.label set from storage tpa:tpa loaded_lang.tpa_menu_lang_button
data modify storage tpa:tpa temp.menu.lang.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_lang_button_hoverevent
scoreboard players set #language_selection_blocked tpa.variables 0
execute if score #player_lang tpa.config matches 0 if score #language tpa.config matches 1.. run scoreboard players set #language_selection_blocked tpa.variables 1
execute if score #language_selection_blocked tpa.variables matches 1 run function tpa:menu/language/block

# Formatted output
tellraw @s ["", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.search_id"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.search_id.button_brackets[1]"}]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.tpahere"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.tpaheremenu.button_brackets[1]"}]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.back"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.back.button_brackets[1]"}]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.language set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.lang.button_brackets[1]"}]}, " " \
]

# Book
data modify storage tpa:tpa temp.menu.book.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.book.label set from storage tpa:tpa loaded_lang.tpa_menu_book_button
data modify storage tpa:tpa temp.menu.book.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_book_button_hoverevent
execute if score #book tpa.config matches 0 run function tpa:menu/book/disabled
execute if score #book tpa.config matches 1 run function tpa:menu/book/enabled

# Pos
data modify storage tpa:tpa temp.menu.pos.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.pos.label set from storage tpa:tpa loaded_lang.tpa_menu_pos_button
data modify storage tpa:tpa temp.menu.pos.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_pos_button_hoverevent
scoreboard players set #tp_pos_enabled tpa.variables 1
execute if score #tp_pos tpa.config matches 0 run scoreboard players set #tp_pos_enabled tpa.variables 0
execute if score #tp_pos_cooldown tpa.config matches -1 run scoreboard players set #tp_pos_enabled tpa.variables 0
execute if score #tp_pos_enabled tpa.config matches 0 run function tpa:menu/pos/disabled
execute if score #tp_pos_enabled tpa.config matches 1 unless predicate tpa:available run function tpa:menu/pos/unavailable

# Here
data modify storage tpa:tpa temp.menu.here.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.here.label set from storage tpa:tpa loaded_lang.tpa_menu_here_button
data modify storage tpa:tpa temp.menu.here.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_here_button_hoverevent

# Home
data modify storage tpa:tpa temp.menu.home.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.home.label set from storage tpa:tpa loaded_lang.tpa_menu_home_button
data modify storage tpa:tpa temp.menu.here.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_home_button_hoverevent
execute if score #home tpa.config matches 0 run function tpa:menu/home/disabled
execute if score #home tpa.config matches 1.. unless predicate tpa:available run function tpa:menu/home/unavailable

# Warp
data modify storage tpa:tpa temp.menu.warp.button_brackets set value ["[", "]"]
data modify storage tpa:tpa temp.menu.warp.label set from storage tpa:tpa loaded_lang.tpa_menu_warp_button
data modify storage tpa:tpa temp.menu.warp.tooltip set from storage tpa:tpa loaded_lang.tpa_menu_warp_button_hoverevent
data modify storage tpa:tpa temp.menu.warp.label set from storage tpa:tpa loaded_lang.tpa_menu_warp_button
execute if score #warp tpa.config matches 0 run function tpa:menu/warp/disabled
execute if score #warp tpa.config matches 1.. unless predicate tpa:available run function tpa:menu/warp/unavailable

# Formatted output
tellraw @s ["",  \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.book.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.book"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.book.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.book.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.book.button_brackets[1]"}]},  " ",  \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.pos.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.pos"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.pos.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.pos.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.pos.button_brackets[1]"}]},  " ",  \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.here.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.here"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.here.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.here.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.here.button_brackets[1]"}]},  " ",  \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.home.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.home set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.home.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.home.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.home.button_brackets[1]"}]},  " ",  \
    {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.warp.button_brackets[0]", click_event: {action: "run_command", command: "/trigger tpa.warp set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.warp.tooltip"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "temp.menu.warp.label", color: "aqua"}, {interpret: true, storage: "tpa:tpa", nbt: "temp.menu.warp.button_brackets[1]"}]},  " " \
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
