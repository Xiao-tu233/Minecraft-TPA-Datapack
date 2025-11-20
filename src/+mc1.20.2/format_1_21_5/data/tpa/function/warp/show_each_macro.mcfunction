# Parent function: tpa:warp/show_each
# @macro: {index: int, dim_color: char}
$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"$(dim_color)", \
        hover_event: {action: "show_text", value: [\
            {storage: "tpa:tpa", nbt: "temp.warp[0].desc"}, " (", \
            {nbt: "temp.warp[0].x", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].y", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].z", storage: "tpa:tpa", color:"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp_hoverevent"}}, click_event: {action: "run_command", command: "/trigger tpa.warp set $(index)"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_disable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 2.. run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"gray", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_enable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/moveup {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]


$execute if score #warp_disabled tpa.variables matches 0 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"$(dim_color)", \
        hover_event: {action: "show_text", value: [\
            {storage: "tpa:tpa", nbt: "temp.warp[0].desc"}, " (", \
            {nbt: "temp.warp[0].x", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].y", storage: "tpa:tpa", color:"$(dim_color)"}, " ", \
            {nbt: "temp.warp[0].z", storage: "tpa:tpa", color:"$(dim_color)"}, ")" \
        ]}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp_hoverevent"}}, click_event: {action: "run_command", command: "/trigger tpa.warp set $(index)"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_disable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/disable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]

$execute if score #warp_disabled tpa.variables matches 1 if score #i tpa.variables matches 1 run tellraw @s [\
    "  ", \
    {\
        storage: "tpa:tpa", nbt: "temp.warp[0].name", color:"gray", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}\
    }, " ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_tp", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_desc_disabled"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setpos", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setpos_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/setpos {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setname", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setname_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_name {index: $(index), name: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_setdesc", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_setdesc_hoverevent"}},click_event: {action: "suggest_command", command: "/function tpa:warp/set_desc {index: $(index), desc: \"\"}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_rm", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_rm_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/remove {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_enable", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_disable_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/enable {index: $(index)}"}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_moveup", color: "gray", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_moveup_notavail_hoverevent"}}}, " ", \
    {storage: "tpa:tpa", nbt: "warp[0].warp_button_movedown", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.warp_button_movedown_hoverevent"}},click_event: {action: "run_command", command: "/function tpa:warp/movedown {index: $(index)}"}}, " " \
]