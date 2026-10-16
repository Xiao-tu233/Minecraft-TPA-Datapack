# Parent function: tpa:request_menu/display/dialog/tpa, tpa:request_menu/display/dialog/tpahere

data modify storage tpa:tpa temp.dialog.actions append value {width: 100, label: {color: "gray"}, tooltip: {color: "red"}}
data modify storage tpa:tpa temp.dialog.actions[-1].label.text set from storage tpa:tpa loaded_lang.tpa_menu_no_available_player
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_no_available_player

# 19 Empty actions to fill the rest of the dialog with blank buttons
data modify storage tpa:tpa temp.dialog.actions append value {width: 100, label: "", tooltip: {color: "red"}}
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_no_available_player
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]
data modify storage tpa:tpa temp.dialog.actions append from storage tpa:tpa temp.dialog.actions[-1]