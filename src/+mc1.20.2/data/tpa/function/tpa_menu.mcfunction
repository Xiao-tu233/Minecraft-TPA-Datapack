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
        score: {name: "@s", objective: "tpa.uid"}\
    }\
]
tellraw @s ["", \
    {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_search_id_button", \
        click_event:{action:"run_command",command: "/trigger tpa.search_id"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button_hoverevent"}}\
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_tpaheremenu_button", \
        click_event:{action:"run_command",command: "/trigger tpa.tpahere"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpaheremenu_button_hoverevent"}}\
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_back_button", \
        click_event:{action:"run_command",command: "/trigger tpa.back"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_back_button_hoverevent"}}\
    }, " " , {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_lang_button", \
        click_event:{action:"run_command",command: "/trigger tpa.language set -1"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_lang_button_hoverevent"}}\
    }, " " \
]
tellraw @s ["", \
    {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_book_button", \
        click_event:{action:"run_command",command: "/trigger tpa.book"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button_hoverevent"}}\
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_pos_button", \
        click_event:{action:"run_command",command: "/trigger tpa.pos"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button_hoverevent"}}\ 
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_here_button", \
        click_event:{action:"run_command",command: "/trigger tpa.here"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button_hoverevent"}}\
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_home_button", \
        click_event:{action:"run_command",command: "/trigger tpa.home set -1"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button_hoverevent"}}\
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_warp_button", \
        click_event:{action:"run_command",command: "/trigger tpa.warp set -1"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button_hoverevent"}}\
    }, " " \
    ]
tellraw @s [\
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_auto_accept"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 3"}}, "|", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 2"}}, " ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_mute"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", click_event:{action:"run_command",command: "/trigger tpa.mute set 3"}}, "|", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", click_event:{action:"run_command",command: "/trigger tpa.mute set 2"}}, " \n ", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output"}, \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_default", click_event:{action:"run_command",command: "/trigger tpa.output set 3"}}, "|", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_actionbar", click_event:{action:"run_command",command: "/trigger tpa.output set 4"}}, "|", \
    {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_chatbar", click_event:{action:"run_command",command: "/trigger tpa.output set 5"}}, " " \
]
tellraw @s [\
    {\
        interpret: true, \
        storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh", \
        click_event:{action:"run_command",command: "/trigger tpa.tpa"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh_hoverevent"}} \
    }, " ", {\
        interpret: true, \
        storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_dialog", \
        click_event:{action:"run_command",command: "/trigger tpa.dialog"}, \
        hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_dialog_hoverevent"}}\
    }, " " \
]
