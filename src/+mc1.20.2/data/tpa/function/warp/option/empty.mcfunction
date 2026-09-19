# Parent function: tpa:warp/option

data remove storage tpa:tpa temp.output
data modify storage tpa:tpa temp.output set from storage tpa:tpa loaded_lang.warp_disabled
function tpa:output/standard

tellraw @s {text: "  §6[§r", extra: [{interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.warp_button_add"}, "§6]§r"], hover_event: {action: "show_text", value: {interpret: true, storage: "tpa:tpa", nbt: "loaded_lang.warp_button_add_hoverevent"}}, click_event: {action: "run_command", command: "/function tpa:warp/add"}}
