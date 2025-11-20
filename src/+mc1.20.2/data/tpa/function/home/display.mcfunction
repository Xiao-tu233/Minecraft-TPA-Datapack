# Parent function: tpa:home/each_home
# @macro: {id: int, dim_color: str}

$tellraw @s[predicate=tpa:output/show_chatbar] [\
    "  ", \
    {\
        "storage": "tpa:tpa", "nbt": "loaded_lang.home_number", "color":"$(dim_color)", \
        "hoverEvent": {"action": "show_text", "value": [\
            {"nbt": "temp.home.$(id).x", "storage": "tpa:tpa","color":"$(dim_color)"}, " ", \
            {"nbt": "temp.home.$(id).y", "storage": "tpa:tpa","color":"$(dim_color)"}, " ", \
            {"nbt": "temp.home.$(id).z", "storage": "tpa:tpa","color":"$(dim_color)"}\
        ]}\
    }, {"storage": "tpa:tpa", "nbt": "temp.args.id", "color":"$(dim_color)"}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_tp_button", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_tp_button_hoverevent"}},"clickEvent": {"action": "run_command","value": "/trigger tpa.home set $(id)"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_rm_button", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_rm_button_hoverevent"}},"clickEvent": {"action": "run_command","value": "/trigger tpa.removehome set $(id)"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_set_button", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.home_display_set_button_hoverevent"}},"clickEvent": {"action": "run_command","value": "/trigger tpa.sethome set $(id)"}} \
]