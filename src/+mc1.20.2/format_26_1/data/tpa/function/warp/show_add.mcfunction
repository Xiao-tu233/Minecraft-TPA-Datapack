# Parent function: tpa:warp/menu
# @macro: {index: int}
$tellraw @s ["  ", {interpret: true, storage: "tpa:tpa", nbt: "warp[0].warp_button_add",hover_event:{action:"show_text",value:{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.warp_button_add_hoverevent"}},click_event:{action:"run_command",command:"/function tpa:warp/setpos {index: $(index)}"}}]

data modify storage tpa:tpa temp.args.dialog.actions append value {width: 300, action: {type: "minecraft:run_command", command: ""}, label: {text: "", color: "green"}, tooltip: {text: "", color: "aqua"}}
data modify entity @n[type=text_display, tag=tpa.text_display] text set string storage tpa:tpa warp[0].warp_button_add 1 -1
data modify storage tpa:tpa temp.args.dialog.actions[-1].label.text set from entity @n[type=text_display, tag=tpa.text_display] text
data modify entity @n[type=text_display, tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_button_add_hoverevent
data modify storage tpa:tpa temp.args.dialog.actions[-1].tooltip.text set from entity @n[type=text_display, tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.dialog.actions[-1].action.command set value "function tpa:warp/setpos {index: $(index)}"