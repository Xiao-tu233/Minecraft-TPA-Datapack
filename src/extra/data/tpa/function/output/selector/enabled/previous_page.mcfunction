# Parent function: tpa:output/warp/menu
data modify storage tpa:tpa temp.output.buttons.disabled.previous_page.brackets set value ["", ""]
data modify storage tpa:tpa temp.output.buttons.disabled.previous_page.label set value ""
execute unless score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/previous_page/normal
execute if score #output.editting tpa.variables matches 1 run function tpa:output/selector/enabled/previous_page/editting
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip set value [{color: "aqua"}, "(", {color: "green"}, {color: "aqua", text: "/"}, {color: "white"}, ")"]
data modify storage tpa:tpa temp.dialog.actions[-3].tooltip[0].text set from storage tpa:tpa temp.output.button_previous_page_hover
data modify storage tpa:tpa temp.dialog.actions[-3].tooltip[2].text set from storage tpa:tpa temp.output.previous_page
data modify storage tpa:tpa temp.dialog.actions[-3].tooltip[4].text set from storage tpa:tpa temp.output.total_pages