# Parent Function: tpa:home/menu
$tellraw @s[scores={tpa.output=1..2}] [\
        {\
            "text":"  ", \
            "hoverEvent": {"action": "show_text", "value": {"storage":"tpa:tpa", "nbt":"temp.lang.home_create_button_hoverevent"}}, \
            "clickEvent": {"action": "run_command", "value": "/trigger tpa.sethome set $(id)"}\
        }, \
        "[", \
        {"storage": "tpa:tpa", "nbt": "temp.lang.home_new"}, \
        {"storage": "tpa:tpa", "nbt": "temp.lang.home_number", "color": "aqua"}, \
        {"storage": "tpa:tpa", "nbt": "temp.args.id", "color": "aqua"}, \
        {"storage": "tpa:tpa", "nbt": "temp.home.slash"}, \
        {"storage": "tpa:tpa", "nbt": "temp.home.limit"}, \
        "§r]" \
        ]