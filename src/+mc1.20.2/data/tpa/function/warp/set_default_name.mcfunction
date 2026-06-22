# Parent function: tpa:warp/setpos
data modify entity @n[tag=tpa.text_display] text set from storage tpa:tpa loaded_lang.warp_number
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.warp_number set from entity @n[tag=tpa.text_display] text
$data modify storage tpa:tpa temp.args.index set value $(index)
function tpa:warp/set_default_name_macro with storage tpa:tpa temp.args
