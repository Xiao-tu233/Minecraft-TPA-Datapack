# Parent Function: tpa:simple_menu/loop
# @macro: {i: int, result: string}
data modify storage tpa:tpa temp.simple_menu.result append value {color:"dark_gray", text: " | "}
$data modify storage tpa:tpa temp.simple_menu.result append value \
    {\
        selector:"@p[scores={tpa.player_id=$(i)}]", \
        click_event:{action:"run_command",command:"/trigger tpa.tpa set $(i)"}, \
        hover_event:{action:"show_text",value:[\
            {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_left_part"}, \
            {selector:"@p[scores={tpa.player_id=$(i)}]"}, \
            {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.tpa_menu_hoverevent_right_part"}\
        ]}\
    }