
scoreboard players set #is_menu_open tpa.variables 1
scoreboard players set @s tpa.tpahere -1

function tpa:load_lang

function tpa:sounds/levelup
scoreboard players set #request_menu.direction tpa.variables 1
scoreboard players set #request_menu.page tpa.variables 1
function tpa:request_menu/open

tellraw @s ["",\
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
        score: {name: "@s", objective: "tpa.uid"}\
    }\
]
function tpa:tpahere_menu/display_first_buttons
tellraw @s ["", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.book"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.pos"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.here"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.home set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.warp set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button"}, "]"]}, " " \
]

tellraw @s [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_auto_accept"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable"}, "]"]}, "|", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 2"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable"}, "]"]}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_mute"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.mute set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable"}, "]"]}, "|", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.mute set 2"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable"}, "]"]}, " \n ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output"}, \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.output set 3"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_default"}, "]"]}, "|", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.output set 4"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_actionbar"}, "]"]}, "|", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.output set 5"}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_chatbar"}, "]"]}, " " \
]
