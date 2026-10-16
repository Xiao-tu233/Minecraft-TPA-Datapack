# Parent function: tpa:dialog
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.search_id_disabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.color set value "red"