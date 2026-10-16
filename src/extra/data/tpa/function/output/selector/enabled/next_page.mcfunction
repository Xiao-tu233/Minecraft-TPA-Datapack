# Parent function: tpa:output/warp/menu
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.brackets set value ["", ""]
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.label set value ""
execute unless score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/next_page/normal
execute if score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/next_page/editting