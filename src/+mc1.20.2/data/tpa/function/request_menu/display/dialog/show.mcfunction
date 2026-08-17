# Parent function: tpa:request_menu/tpa, tpa:request_menu/tpahere 
data remove storage tpa:tpa temp.args
data modify storage tpa:tpa temp.args.dialog set from storage tpa:tpa temp.dialog
function tpa:dialog/display with storage tpa:tpa temp.args