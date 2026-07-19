# Parent function: tpa:tpahere_menu/display_first_buttons

tellraw @s ["", \
    {text: "[", color: "white", click_event:{action:"run_command",command: "/trigger tpa.idfix"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_idfix_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_idfix_button"}, {text: "]", color: "white"}]}, " ", \
    {text: "[", color: "white", click_event:{action:"run_command",command: "/trigger tpa.search_id"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_search_id_button"}, {text: "]", color: "white"}]}, " ", \
    {text: "[", color: "white", click_event:{action:"run_command",command: "/trigger tpa.tpa"}, hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpamenu_button_hoverevent"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_tpamenu_button"}, {text: "]", color: "white"}]}, " ", \
    {text: "[", color: "dark_gray", hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "temp.tpa_menu.back_button_hover"}}, extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_back_button", color: "gray"}, {text: "]", color: "dark_gray"}]}, " " \
]
