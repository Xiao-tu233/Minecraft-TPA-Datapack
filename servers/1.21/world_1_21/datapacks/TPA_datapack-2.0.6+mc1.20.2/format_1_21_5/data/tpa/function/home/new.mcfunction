# Parent Function: tpa:home/menu
$tellraw @s[scores={tpa.output=1..2}] [\
        {\
            text:"  ", \
            hover_event: {action: "show_text", value: {storage:"tpa:tpa", nbt:"temp.lang.home_create_button_hoverevent"}}, \
            click_event: {action: "run_command", command: "/trigger tpa.sethome set $(id)"}\
        }, \
        "[", \
        {storage: "tpa:tpa", nbt: "temp.lang.home_new"}, \
        {storage: "tpa:tpa", nbt: "temp.lang.home_number", color: "aqua"}, \
        {storage: "tpa:tpa", nbt: "temp.args.id", color: "aqua"}, \
        {storage: "tpa:tpa", nbt: "temp.home.slash"}, \
        {storage: "tpa:tpa", nbt: "temp.home.limit"}, \
        "§r]" \
        ]