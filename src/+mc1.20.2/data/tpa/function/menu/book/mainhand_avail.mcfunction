# Parent function: tpa:dialog/menu/book/available

data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.tpa_menu_book_button_hoverevent
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.action set value {type: "minecraft:run_command", command: "/trigger tpa.book"}