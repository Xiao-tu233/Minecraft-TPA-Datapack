# Parent Function: tpa:simple_menu/loop
# @macro: {i: int, result: string}
$data modify storage tpa:tpa temp.simple_menu.result set value '\
    $(result), \
    {"color":"dark_gray", "text": " | "}, \
    {\
        "selector":"@p[scores={tpa.player_id=$(i)}]", \
        "clickEvent":{"action":"run_command","value":"/trigger tpa.tpa set $(i)"}, \
        "hoverEvent":{"action":"show_text","value":[\
            {"storage": "tpa:tpa", "nbt": "temp.lang.tpa_menu_hoverevent_left_part"}, \
            {"selector":"@p[scores={tpa.player_id=$(i)}]"}, \
            {"storage": "tpa:tpa", "nbt": "temp.lang.tpa_menu_hoverevent_right_part"}\
        ]}\
    }\
'