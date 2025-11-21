# Parent function: tpa:tpa_menu
# @Macro args: {id_1: int, id_2": int, id_3": int, id_4": int, id_5": int, direction: str["tpa" or "tpahere"]} 
$tellraw @s [\
    {\
        "text": " $(id_1)", "color": "dark_gray", \
        "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_1)"}, \
        "hoverEvent":{\
            "action":"show_text", \
            "value":[\
                {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, \
                {"selector": "@a[scores={tpa.player_id=$(id_1)}]"}, \
                {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}\
            ]\
        }, \
        "extra": [\
            {"text": ": ", "color": "white"}, \
            {\
                "selector":"@a[scores={tpa.player_id=$(id_1)}]", \
                "color": "white", \
                "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_1)"}, \
                "hoverEvent":{\
                    "action":"show_text", \
                    "value":[\
                        {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, \
                        {"selector": "@a[scores={tpa.player_id=$(id_1)}]"}, \
                        {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}\
                    ]\
                }\
            }\
        ]\
    }, \
    {"text": " $(id_2)", "color": "dark_gray", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_2)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_2)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}, "extra": [{"text": ": ", "color": "white"}, {"selector":"@a[scores={tpa.player_id=$(id_2)}]", "color": "white", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_2)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_2)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}}]}, \
    {"text": " $(id_3)", "color": "dark_gray", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_3)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_3)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}, "extra": [{"text": ": ", "color": "white"}, {"selector":"@a[scores={tpa.player_id=$(id_3)}]", "color": "white", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_3)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_3)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}}]}, \
    {"text": " $(id_4)", "color": "dark_gray", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_4)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_4)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}, "extra": [{"text": ": ", "color": "white"}, {"selector":"@a[scores={tpa.player_id=$(id_4)}]", "color": "white", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_4)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_4)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}}]}, \
    {"text": " $(id_5)", "color": "dark_gray", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_5)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_5)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}, "extra": [{"text": ": ", "color": "white"}, {"selector":"@a[scores={tpa.player_id=$(id_5)}]", "color": "white", "clickEvent":{"action":"run_command","value":"/trigger tpa.$(direction) set $(id_5)"}, "hoverEvent":{"action":"show_text", "value":[{"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_left_part"}, {"selector": "@a[scores={tpa.player_id=$(id_5)}]"}, {"storage": "tpa:tpa", "nbt": "loaded_lang.tpa_menu_hoverevent_right_part"}]}}]}  \
]