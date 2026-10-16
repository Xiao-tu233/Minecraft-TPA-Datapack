# Parent function: tpa:dialog/menu/book/enabled

data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.book_unavail
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.color set value "red"