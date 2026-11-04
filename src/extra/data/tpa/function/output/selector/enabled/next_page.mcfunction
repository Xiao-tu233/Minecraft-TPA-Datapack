# Parent function: tpa:output/warp/menu
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.brackets set value ["", ""]
data modify storage tpa:tpa temp.output.buttons.disabled.next_page.label set value ""
execute unless score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/next_page/normal
execute if score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/next_page/editting
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set value [{color: "aqua"}, "(", {color: "green"}, {color: "aqua", text: "/"}, {color: "white"}, ")"]
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip[0].text set from storage tpa:tpa temp.output.button_next_page_hover
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip[2].text set from storage tpa:tpa temp.output.next_page
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip[4].text set from storage tpa:tpa temp.output.total_pages