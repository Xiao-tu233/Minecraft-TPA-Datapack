# Parent function: tpa:warp/show_each
# @macro: {index: int, dim_color: char}
$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        "storage": "tpa:tpa", "nbt": "temp.warp[0].name", "color":"$(dim_color)", \
        "hoverEvent": {"action": "show_text", "value": [\
            {"storage": "tpa:tpa", "nbt": "temp.warp[0].desc"}, " (", \
            {"nbt": "temp.warp[0].x", "storage": "tpa:tpa", "color":"$(dim_color)"}, " ", \
            {"nbt": "temp.warp[0].y", "storage": "tpa:tpa", "color":"$(dim_color)"}, " ", \
            {"nbt": "temp.warp[0].z", "storage": "tpa:tpa", "color":"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp_hoverevent"}}, "clickEvent": {"action": "run_command","value": "/trigger tpa.warp set $(index)"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_disable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_moveup", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_moveup_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_movedown", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_movedown_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        "storage": "tpa:tpa", "nbt": "temp.warp[0].name", "color":"gray", \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp", "color": "gray", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_desc_disabled"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_enable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_moveup", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_moveup_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_movedown", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_movedown_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]


$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        "storage": "tpa:tpa", "nbt": "temp.warp[0].name", "color":"$(dim_color)", \
        "hoverEvent": {"action": "show_text", "value": [\
            {"storage": "tpa:tpa", "nbt": "temp.warp[0].desc"}, " (", \
            {"nbt": "temp.warp[0].x", "storage": "tpa:tpa", "color":"$(dim_color)"}, " ", \
            {"nbt": "temp.warp[0].y", "storage": "tpa:tpa", "color":"$(dim_color)"}, " ", \
            {"nbt": "temp.warp[0].z", "storage": "tpa:tpa", "color":"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp_hoverevent"}}, "clickEvent": {"action": "run_command","value": "/trigger tpa.warp set $(index)"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_disable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_moveup", "color": "gray", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_movedown", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_movedown_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        "storage": "tpa:tpa", "nbt": "temp.warp[0].name", "color":"gray", \
        "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_tp", "color": "gray", "hoverEvent": {"action": "show_text","value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_desc_disabled"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setpos", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setpos_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setname", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setname_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_setdesc", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_setdesc_hoverevent"}},"clickEvent": {"action": "suggest_command","value": "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_rm", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_rm_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_enable", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_disable_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_moveup", "color": "gray", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {"storage": "tpa:tpa", "nbt": "warp[0].warp_button_movedown", "hoverEvent": {"action": "show_text", "value": {"storage": "tpa:tpa", "nbt": "loaded_lang.warp_button_movedown_hoverevent"}},"clickEvent": {"action": "run_command","value": "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]