# Parent function: tpa:dialog
data modify storage tpa:tpa temp.dialog.body.contents[-1].tooltip.text set from storage tpa:tpa loaded_lang.lang_disabled
data modify storage tpa:tpa temp.dialog.body.contents[-1].tooltip.color set value "red"