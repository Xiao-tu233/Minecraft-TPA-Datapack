# Parent function: tpa:dialog/menu/warp/enabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.text set from storage tpa:tpa loaded_lang.warp_disabled
data modify storage tpa:tpa temp.dialog.actions[-1].tooltip.color set value "red"