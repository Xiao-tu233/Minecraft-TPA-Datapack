# Parent function: tpa:warp/menu
# @macro: {index: int}
$tellraw @s ["  ", {storage: "tpa:tpa", nbt: "warp[0].warp_button_add",hover_event:{action:"show_text",value:{storage: "tpa:tpa", nbt: "loaded_lang.warp_button_add_hoverevent"}},click_event:{action:"run_command",command:"/function tpa:warp/setpos {index: $(index)}"}}]