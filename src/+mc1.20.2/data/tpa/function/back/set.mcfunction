# Parent Function: tpa:tpa, tpa:back/found, tpa:tpaccept, tpa:tp_pos/act, tpa:home, tpa:warp/act

data remove storage tpa:tpa temp.args
execute store result storage tpa:tpa temp.args.uid int 1 run scoreboard players get @s tpa.uid
function tpa:back/set_macro with storage tpa:tpa temp.args