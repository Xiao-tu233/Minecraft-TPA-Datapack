# Called by: tpa:warp/setdesc/slot_*

data remove storage tpa:tpa temp.warp_edit
data modify storage tpa:tpa temp.warp_edit.index set value 0
execute store result storage tpa:tpa temp.warp_edit.index int 1 run scoreboard players get #warp.edit.index tpa.variables
data modify storage tpa:tpa temp.warp_edit.field set value "desc"
function tpa:warp/edit/desc/menu
