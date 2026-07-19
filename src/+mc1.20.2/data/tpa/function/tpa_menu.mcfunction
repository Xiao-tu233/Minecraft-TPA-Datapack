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

tellraw @s ["", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.search_id"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.tpahere"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpaheremenu_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpaheremenu_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.back"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_back_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_back_button", color: "aqua"}, "]"]}, " ", \
    {text: "[", click_event:{action:"run_command",command: "/trigger tpa.language set -1"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_lang_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_lang_button", color: "aqua"}, "]"]}, " " \
]

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
