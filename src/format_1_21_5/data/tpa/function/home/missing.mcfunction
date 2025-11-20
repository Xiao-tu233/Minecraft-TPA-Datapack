# Parent function: tpa:each_home
$tellraw @s[predicate=tpa:output/show_chatbar] [\
    "  ", \
    {storage: "tpa:tpa", nbt: "loaded_lang.home_number", hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_missing_hoverevent"}}}, \
    {storage: "tpa:tpa", nbt: "temp.args.id"}, \
    " ", \
    {\
        storage: "tpa:tpa", \
        nbt: "loaded_lang.home_create_button", \
        hover_event: {action: "show_text", value: {storage: "tpa:tpa", nbt: "loaded_lang.home_create_button_hoverevent"}}, \
        click_event: {action: "run_command", command: "/trigger tpa.sethome set $(id)"}\
    }\
]