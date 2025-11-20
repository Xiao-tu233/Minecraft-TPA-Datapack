
scoreboard players set #is_menu_open tpa.variables 1
scoreboard players set @s tpa.tpahere 0

function tpa:load_lang

function tpa:sounds/levelup
tellraw @s [{"storage": "tpa:tpa", "nbt": "loaded_lang.header"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_title"}]
function tpa:iddisplay {"id_1": 2, "id_2": 3, "id_3": 4, "id_4": 5, "id_5": 6, "direction": "tpahere"}
function tpa:iddisplay {"id_1": 7, "id_2": 8, "id_3": 9, "id_4": 10, "id_5": 11, "direction": "tpahere"}
function tpa:iddisplay {"id_1": 12, "id_2": 13, "id_3": 14, "id_4": 15, "id_5": 16, "direction": "tpahere"}
function tpa:iddisplay {"id_1": 17, "id_2": 18, "id_3": 19, "id_4": 20, "id_5": 21, "direction": "tpahere"}
tellraw @s [" ...", {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_extend", "clickEvent": {"action": "run_command", "value": "/trigger tpa.extended_menu"}, "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_extend_hoverevent"}}},"}"]

tellraw @s [\
    " ", \
    {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_you", \
        "color": "gold", \
        "hoverEvent": {\
            "action": "show_text", \
            "value": {"selector": "@s"}\
        }\
    }, \
    {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_has_id_of", \
        "hoverEvent": {\
            "action": "show_text", \
            "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_has_id_of_hoverevent"} \
        }\
    }, \
    {\
        "color": "aqua", \
        "score": {"name": "@s", "objective": "tpa.player_id"}\
    }\
]
tellraw @s ["", \
    {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_idfix_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.idfix"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_idfix_button_hoverevent"}}\
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_search_id_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.search_id"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_search_id_button_hoverevent"}}\
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_tpamenu_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpa"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_tpamenu_button_hoverevent"}}\
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_back_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.back"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_back_button_hoverevent"}}\
    }, " " \
]
tellraw @s ["", \
    {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_book_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.book"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_book_button_hoverevent"}}\
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_pos_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.pos"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_pos_button_hoverevent"}}\ 
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_here_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.here"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_here_button_hoverevent"}}\
    }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_home_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.home set -1"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_home_button_hoverevent"}}\
        }, " ", {\
        "storage": "tpa:tpa", \
        "nbt": "loaded_lang.tpa_menu_warp_button", \
        "clickEvent": {"action": "run_command", "value": "/trigger tpa.warp set -1"}, \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_warp_button_hoverevent"}}\
    }, " " \
]

tellraw @s [\
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_auto_accept"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_enable", "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpaccept_toggle set 3"}}, "|", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_disable", "clickEvent": {"action": "run_command", "value": "/trigger tpa.tpaccept_toggle set 2"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_mute"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_enable", "clickEvent": {"action": "run_command", "value": "/trigger tpa.mute set 3"}}, "|", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_disable", "clickEvent": {"action": "run_command", "value": "/trigger tpa.mute set 2"}}, " \n ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_output"}, \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_output_default", "clickEvent": {"action": "run_command", "value": "/trigger tpa.output set 3"}}, "|", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_output_actionbar", "clickEvent": {"action": "run_command", "value": "/trigger tpa.output set 4"}}, "|", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_output_chatbar", "clickEvent": {"action": "run_command", "value": "/trigger tpa.output set 5"}}, " " \
]