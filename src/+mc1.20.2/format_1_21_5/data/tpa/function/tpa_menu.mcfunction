scoreboard players set #is_menu_open tpa.variables 1
scoreboard players set @s tpa.tpa 0
scoreboard players set @s tpa 0

function tpa:load_lang

function tpa:sounds/levelup
tellraw @s [{storage: "tpa:tpa", nbt: "loaded_lang.header"}, {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_title"}]
function tpa:iddisplay {"id_1": 2, "id_2": 3, "id_3": 4, "id_4": 5, "id_5": 6, "direction": "tpa"}
function tpa:iddisplay {"id_1": 7, "id_2": 8, "id_3": 9, "id_4": 10, "id_5": 11, "direction": "tpa"}
function tpa:iddisplay {"id_1": 12, "id_2": 13, "id_3": 14, "id_4": 15, "id_5": 16, "direction": "tpa"}
function tpa:iddisplay {"id_1": 17, "id_2": 18, "id_3": 19, "id_4": 20, "id_5": 21, "direction": "tpa"}
tellraw @s [" ...", {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_extend", click_event:{action:"run_command",command: "/trigger tpa.extended_menu"}, hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_extend_hoverevent"}}},"}"]

tellraw @s [\
    " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_you", \
        color: "gold", \
        hover_event: {\
            action: "show_text", \
            "value": {selector: "@s"}\
        }\
    }, \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_has_id_of", \
        hover_event: {\
            action: "show_text", \
            "value": {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_has_id_of_hoverevent"} \
        }\
    }, \
    {\
        color: "aqua", \
        score: {name: "@s", objective: "tpa.player_id"}\
    }\
]
tellraw @s ["", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_idfix_button", \
        click_event:{action:"run_command",command: "/trigger tpa.idfix"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_idfix_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_search_id_button", \
        click_event:{action:"run_command",command: "/trigger tpa.search_id"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_tpaheremenu_button", \
        click_event:{action:"run_command",command: "/trigger tpa.tpahere"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpaheremenu_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_back_button", \
        click_event:{action:"run_command",command: "/trigger tpa.back"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_back_button_hoverevent"}}\
    }, " " , {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_lang_button", \
        click_event:{action:"run_command",command: "/trigger tpa.language set -1"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_lang_button_hoverevent"}}\
    }, " " \
]
tellraw @s ["", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_book_button", \
        click_event:{action:"run_command",command: "/trigger tpa.book"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_book_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_pos_button", \
        click_event:{action:"run_command",command: "/trigger tpa.pos"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_pos_button_hoverevent"}}\ 
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_here_button", \
        click_event:{action:"run_command",command: "/trigger tpa.here"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_here_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_home_button", \
        click_event:{action:"run_command",command: "/trigger tpa.home set -1"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_home_button_hoverevent"}}\
    }, " ", {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.tpa_menu_warp_button", \
        click_event:{action:"run_command",command: "/trigger tpa.warp set -1"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_warp_button_hoverevent"}}\
    }, " " \
    ]
tellraw @s [\
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_auto_accept"}, \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 3"}}, "|", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", click_event:{action:"run_command",command: "/trigger tpa.tpaccept_toggle set 2"}}, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_mute"}, \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_enable", click_event:{action:"run_command",command: "/trigger tpa.mute set 3"}}, "|", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_disable", click_event:{action:"run_command",command: "/trigger tpa.mute set 2"}}, " \n ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output"}, \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_default", click_event:{action:"run_command",command: "/trigger tpa.output set 3"}}, "|", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_actionbar", click_event:{action:"run_command",command: "/trigger tpa.output set 4"}}, "|", \
    {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_output_chatbar", click_event:{action:"run_command",command: "/trigger tpa.output set 5"}}, " " \
]
tellraw @s [\
    {\
        storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh", \
        click_event:{action:"run_command",command: "/trigger tpa.tpa"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_refresh_hoverevent"}} \
    }, " ", {\
        storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_simplemenu_button", \
        click_event:{action:"run_command",command: "/trigger tpa.simple_menu set 2"}, \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_simplemenu_button_hoverevent"}}\
    }, " " \
]

