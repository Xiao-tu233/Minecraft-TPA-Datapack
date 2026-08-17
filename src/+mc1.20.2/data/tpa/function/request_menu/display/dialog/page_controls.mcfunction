# Parent function: tpa:request_menu/display/dialog/tpa, tpa:request_menu/display/dialog/tpahere

data modify storage tpa:tpa temp.dialog.actions append value {label: "", width: 100}
data modify storage tpa:tpa temp.dialog.actions append value {label: {text: "<", color: "dark_gray"}, width: 100}
execute if score #request_menu.page tpa.variables matches 2.. run function tpa:request_menu/display/dialog/page_controls/has_previous

data modify storage tpa:tpa temp.dialog.actions append value {label: [{color: "yellow"}, {text: "/", color: "gray"}, {color: "yellow"}], width: 100}
execute store result storage tpa:tpa temp.dialog_request_menu.page int 1 run scoreboard players get #request_menu.page tpa.variables
data modify storage tpa:tpa temp.dialog_request_menu.page set string storage tpa:tpa temp.dialog_request_menu.page
data modify storage tpa:tpa temp.dialog.actions[-1].label[0].text set from storage tpa:tpa temp.dialog_request_menu.page
execute store result storage tpa:tpa temp.dialog_request_menu.total_pages int 1 run scoreboard players get #request_menu.total_pages tpa.variables
data modify storage tpa:tpa temp.dialog_request_menu.total_pages set string storage tpa:tpa temp.dialog_request_menu.total_pages
data modify storage tpa:tpa temp.dialog.actions[-1].label[2].text set from storage tpa:tpa temp.dialog_request_menu.total_pages

data modify storage tpa:tpa temp.dialog.actions append value {label: {text: ">", color: "dark_gray"}, width: 100}
execute if score #request_menu.page tpa.variables < #request_menu.total_pages tpa.variables run function tpa:request_menu/display/dialog/page_controls/has_next


data modify storage tpa:tpa temp.dialog.actions append value {label: "", width: 100}