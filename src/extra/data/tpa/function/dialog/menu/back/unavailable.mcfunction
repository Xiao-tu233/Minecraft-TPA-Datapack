# Parent function: tpa:dialog/menu/back/enabled
data modify storage tpa:tpa temp.dialog.body.contents[-1].tooltip.text set from storage tpa:tpa loaded_lang.back_unavail
data modify storage tpa:tpa temp.dialog.body.contents[-1].tooltip.color set value "red"